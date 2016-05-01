class AddFullNameToReportItems < ActiveRecord::Migration
  def change
    add_column :report_items, :full_name, :string
  end
end
