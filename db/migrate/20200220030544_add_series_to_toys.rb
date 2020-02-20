class AddSeriesToToys < ActiveRecord::Migration[6.0]
  def change
    add_column :toys, :series, :string
  end
end
