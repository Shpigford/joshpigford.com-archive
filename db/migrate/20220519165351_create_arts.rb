class CreateArts < ActiveRecord::Migration[7.0]
  def change
    create_table :arts do |t|
      t.string :name
      t.string :series
      t.text :description
      t.text :tools
      t.boolean :nft
      t.string :external_link

      t.timestamps
    end
  end
end
