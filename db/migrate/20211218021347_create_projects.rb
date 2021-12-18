class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :slug
      t.string :year
      t.text :description
      t.text :outcome
      t.text :notes
      t.string :link

      t.timestamps
    end
  end
end
