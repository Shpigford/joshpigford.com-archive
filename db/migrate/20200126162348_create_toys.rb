class CreateToys < ActiveRecord::Migration[6.0]
  def change
    create_table :toys do |t|
      t.string  :name
      t.text    :description
      t.string  :artist
      t.string  :manufacturer
      t.date    :release_date
      t.string  :size
      t.string  :platform
      t.string  :color
      t.timestamps
    end
  end
end
