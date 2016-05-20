class AddRolesMaskToDoctors < ActiveRecord::Migration
  def change
    add_column :doctors, :roles_mask, :integer
  end
end
