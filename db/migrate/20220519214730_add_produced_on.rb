class AddProducedOn < ActiveRecord::Migration[7.0]
  def change
    add_column :arts, :produced_on, :date
  end
end
