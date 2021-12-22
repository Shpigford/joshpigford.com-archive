class NftsController < ApplicationController
  def index
    @nfts = Nft.all.order(:collection_name, :asset_name).where(hidden: false).where.not(asset_image_url: nil)
    @title = 'NFTs'
    @description = "My NFT collection."
  end

  def show
    @nft = Nft.find_by(slug: params[:id])
    @title = "#{@nft.asset_name} - #{@nft.collection_name} - NFTs"
  end
end
