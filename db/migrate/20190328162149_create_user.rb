class CreateUser < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :email_address

      t.timestamps
    end
  end
end
