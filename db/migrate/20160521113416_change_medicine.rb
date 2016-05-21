class ChangeMedicine < ActiveRecord::Migration
  def change
  	add_column :medicines, :registry_number, :string
  	add_column :medicines, :registry_start_date, :datetime
  	add_column :medicines, :registry_end_date, :datetime
  	add_column :medicines, :registry_remove_date, :datetime
  	add_column :medicines, :company, :string
  	add_column :medicines, :international_name, :string
  	add_column :medicines, :form, :string
  	add_column :medicines, :stages, :string
  	add_column :medicines, :documents, :string
	  add_column :medicines, :group, :string
  end
end
