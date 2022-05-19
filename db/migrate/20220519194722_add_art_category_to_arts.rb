class AddArtCategoryToArts < ActiveRecord::Migration[7.0]
  def change
    add_reference :arts, :art_category, null: true, foreign_key: true
  end
end
