module NftsHelper
  def nft_image(url)
    if url.include?('ipfs:')
      token = url.gsub('ipfs://','')
      "https://cloudflare-ipfs.com/ipfs/#{token}/"
    else
      url
    end
  end
end
