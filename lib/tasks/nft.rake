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
end