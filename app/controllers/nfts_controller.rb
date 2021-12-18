class NftsController < ApplicationController
  def index
    @nfts = Nft.all.order(:collection_name, :asset_name)
    @title = 'NFTs'
    @description = "My NFT collection."
  end

  def show
  end
end
