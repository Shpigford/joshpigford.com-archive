class CreateNfts < ActiveRecord::Migration[7.0]
  def change
    create_table :nfts do |t|
      t.string :asset_name
      t.string :collection_name
      t.string :identifier
      t.string :token_id
      t.string :asset_contract_address
      t.string :asset_image_url
      t.string :collection_image_url
      t.text :description
      t.string :external_link
      t.string :network
      t.string :slug
      t.datetime :acquired_at
      t.boolean :hidden, default: false

      t.timestamps
    end
  end
end
