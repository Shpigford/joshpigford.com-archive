class AddInfoToToys < ActiveRecord::Migration[6.0]
  def change
    add_column :toys, :original_price, :string
  end
end
