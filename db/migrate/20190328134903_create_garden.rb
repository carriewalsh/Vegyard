class CreateGarden < ActiveRecord::Migration[5.1]
  def change
    create_table :gardens do |t|
      t.string :owner
      t.integer :planters
      t.string :sun

      t.timestamps
    end
  end
end
