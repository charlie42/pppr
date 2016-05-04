class AddAdminToDoctors < ActiveRecord::Migration
  def change
    add_column :doctors, :admin, :boolean, default: false
  end
end
