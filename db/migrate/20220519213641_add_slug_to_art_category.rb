class AddSlugToArtCategory < ActiveRecord::Migration[7.0]
  def change
    add_column :art_categories, :slug, :string
  end
end
