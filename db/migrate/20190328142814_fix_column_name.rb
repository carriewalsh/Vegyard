class FixColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :plants, :type, :name
  end
end
