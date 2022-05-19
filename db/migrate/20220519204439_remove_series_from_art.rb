class RemoveSeriesFromArt < ActiveRecord::Migration[7.0]
  def change
    remove_column :arts, :series
  end
end
