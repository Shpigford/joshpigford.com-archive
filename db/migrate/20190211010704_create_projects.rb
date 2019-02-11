class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :year
      t.text :description
      t.text :outcome
      t.text :notes
      t.text :link
      t.timestamps
    end
  end
end
