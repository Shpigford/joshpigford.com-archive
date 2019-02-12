class CreateStreams < ActiveRecord::Migration[5.2]
  def change
    create_table :streams do |t|
      t.string :artist_name
      t.string :song_name
      t.string :album_name
      t.string :album_image
      t.datetime :listened_at
      t.timestamps
    end
  end
end
