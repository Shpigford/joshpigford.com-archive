namespace :nft do
  desc "Import ETH"
  task :import_eth => :environment do
    more_events = true
    offset = 0
    current_nfts = []

    until more_events === false do
      begin
        os_assets = HTTParty.get("https://api.opensea.io/api/v1/assets?owner=0xA947a87F204F1f5203Bfa6C8A5912d428A6525D7&order_direction=desc&offset=#{offset}&limit=50").body
        os_assets_data = JSON.parse(os_assets)
      rescue
        if os_assets_data.include?('Request was throttled')
          puts "Throttled"
          sleep(30)
        else
          sleep(5)
        end

        retry
      end

      if os_assets_data['assets'].blank?
        more_events = false
      else
        os_assets_data['assets'].each do |os_asset|
          asset = Nft.find_or_create_by(identifier: os_asset["id"])

          asset.asset_name = os_asset['name']
          asset.collection_name = os_asset['collection']['name']
          asset.token_id = os_asset['token_id']
          asset.asset_contract_address = os_asset['asset_contract']['address']
          asset.asset_image_url = os_asset['image_url']
          asset.collection_image_url = os_asset['collection']['image_url'].gsub('=s120','') if os_asset['collection']['image_url'].present?
          asset.description = os_asset['description']
          asset.external_link = os_asset['permalink']
          asset.network = 'ETH'
          asset.slug = os_asset['name'].parameterize

          asset.save

          current_nfts.push(asset.id)
        end
        
        offset += 50
      end
    end

    #######################################################################
    # Find NFTs that are no longer in collection and remove them
    #######################################################################
    removed_nfts = Nft.where(network: 'ETH').where.not(id: current_nfts)
    removed_nfts.delete_all
  end

  desc "Import OBJKT"
  task :import_objkt => :environment do
    obj_assets = HTTParty.post("https://api.objkt.com/v1/graphql", :body => '{"operationName":"GetObjktsByHolderPaged","variables":{"where":{"holder_id":{"_eq":"tz1UL8WZFehWzDLzdAzHHW6ELcUngSP9m1T5"},"quantity":{"_gt":0},"token":{"creator_id":{},"fa2":{"live":{"_eq":true}},"fa2_id":{},"supply":{"_gt":"0"},"flag":{"_neq":"removed"},"artifact_uri":{"_neq":""},"_or":[{"title":{}},{"creator_id":{}},{"creator":{"alias":{}}},{"creator":{"tzdomain":{}}},{"id":{"_eq":"-1"}}]}},"order_by":{"last_incremented":"desc_nulls_last"},"limit":50,"offset":0},"query":"query GetObjktsByHolderPaged($limit: Int!, $offset: Int!, $where: token_holder_bool_exp = {}, $order_by: [token_holder_order_by!] = {}) {\n  token_holder(limit: $limit, offset: $offset, where: $where, order_by: $order_by) {\n    token {\n      ...TokenDefault\n      __typename\n    }\n    __typename\n  }\n  token_holder_aggregate(where: $where) {\n    aggregate {\n      count\n      __typename\n    }\n    __typename\n  }\n}\n\nfragment TokenDefault on token {\n  id\n  artifact_uri\n  creator_id\n  description\n  display_uri\n  thumbnail_uri\n  fa2_id\n  royalties\n  supply\n  timestamp\n  title\n  mime\n  last_listed\n  highest_bid\n  lowest_ask\n  flag\n  fa2 {\n    ...Fa2\n    __typename\n  }\n  creator {\n    ...UserDefault\n    __typename\n  }\n  token_attributes {\n    attribute {\n      id\n      name\n      type\n      value\n      count\n      __typename\n    }\n    __typename\n  }\n  __typename\n}\n\nfragment Fa2 on fa2 {\n  active_auctions\n  active_listing\n  contract\n  description\n  name\n  owners\n  logo\n  volume_24h\n  volume_total\n  website\n  twitter\n  items\n  floor_price\n  type\n  collection_type\n  creator_id\n  collection_id\n  path\n  token_link\n  short_name\n  live\n  creator {\n    ...UserDefault\n    __typename\n  }\n  __typename\n}\n\nfragment UserDefault on holder {\n  address\n  alias\n  site\n  twitter\n  description\n  tzdomain\n  flag\n  __typename\n}\n"}').body
    obj_assets_data = JSON.parse(obj_assets)

    obj_tokens = obj_assets_data['data']['token_holder']

    obj_tokens.each do |token|
      obj_asset = token['token']

      asset = Nft.find_or_create_by(identifier: obj_asset["id"])

      asset.asset_name = obj_asset['title']
      asset.collection_name = obj_asset['creator']['tzdomain']
      asset.asset_contract_address = obj_asset['fa2']['contract']
      asset.asset_image_url = obj_asset['display_uri'] if obj_asset['display_uri'].present?
      asset.description = obj_asset['description']
      #asset.external_link = obj_asset['permalink']
      asset.network = 'XTZ'
      asset.slug = obj_asset['title'].parameterize

      asset.save
    end
    
  end

  desc "Import FXHASH"
  task :import_fxhash => :environment do
    fx_assets = HTTParty.post("https://api.fxhash.xyz/graphql", :body => '{"operationName":"Query","variables":{"id":"tz1UL8WZFehWzDLzdAzHHW6ELcUngSP9m1T5","skip":0,"take":50},"query":"query Query($id: String!, $take: Int, $skip: Int) {\n  user(id: $id) {\n    id\n    objkts(take: $take, skip: $skip) {\n      id\n      assigned\n      iteration\n      owner {\n        id\n        name\n        avatarUri\n        __typename\n      }\n      issuer {\n        name\n        flag\n        author {\n          id\n          name\n          avatarUri\n          __typename\n        }\n        __typename\n      }\n      name\n      metadata\n      createdAt\n      updatedAt\n      offer {\n        id\n        price\n        issuer {\n          id\n          name\n          avatarUri\n          __typename\n        }\n        __typename\n      }\n      __typename\n    }\n    __typename\n  }\n}\n"}',
    :headers => {'Content-Type' => 'application/json'} ).body
    fx_assets_data = JSON.parse(fx_assets)

    fx_tokens = fx_assets_data['data']['user']['objkts']

    fx_tokens.each do |token|
      fx_asset = token

      asset = Nft.find_or_create_by(identifier: fx_asset["id"])

      asset.asset_name = fx_asset['name']
      asset.collection_name = fx_asset['issuer']['name']
      asset.asset_image_url = fx_asset['metadata']['displayUri'] if fx_asset['metadata']['displayUri'].present?
      asset.description = fx_asset['metadata']['description']
      #asset.external_link = obj_asset['permalink']
      asset.network = 'XTZ'
      asset.slug = fx_asset['name'].parameterize

      asset.save
    end
  end

end