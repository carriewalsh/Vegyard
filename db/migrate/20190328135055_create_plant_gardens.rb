class CreatePlantGardens < ActiveRecord::Migration[5.1]
  def change
    create_table :plant_gardens do |t|
      t.references :plant, foreign_key: true
      t.references :garden, foreign_key: true
    end
  end
end
