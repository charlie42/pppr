class AddAncestryToReportItems < ActiveRecord::Migration
  def change
    add_column :report_items, :ancestry, :string
    add_index :report_items, :ancestry
  end
end
