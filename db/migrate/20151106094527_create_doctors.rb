class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :username
      t.string :password
      t.string :password_conformation
      t.string :specialization

      t.timestamps null: false
    end
  end
end
