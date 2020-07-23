class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :name_call
      t.string :tel
      t.string :email
      t.integer :age
      t.string :birthday
      t.string :using_surfboard
      t.string :password_digest
      t.boolean :admin
      t.string :remember_digest

      t.timestamps
    end
  end
end
