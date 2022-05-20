class NftsController < ApplicationController
  def index
    @nfts = Nft.all.order(:collection_name, :asset_name).where(hidden: false).where.not(asset_image_url: nil)
  end

  def show
    @nft = Nft.find_by(slug: params[:id])
  end
end
