class CreateToys < ActiveRecord::Migration[7.0]
  def change
    create_table :toys do |t|
      t.string :name
      t.text :description
      t.string :artist
      t.string :manufacturer
      t.date :release_date
      t.string :size
      t.string :platform
      t.string :color
      t.string :series
      t.string :original_price

      t.timestamps
    end
  end
end
