class CreatePlants < ActiveRecord::Migration[5.1]
  def change
    create_table :plants do |t|
      t.string :name
      t.integer :days
      t.integer :distance
      t.string :sun

      t.timestamps
    end
  end
end
