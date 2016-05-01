class AddHorizontalCounterToReportItems < ActiveRecord::Migration
  def change
    add_column :report_items, :horizontal_counter, :integer
  end
end
