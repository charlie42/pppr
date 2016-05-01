class CreateReportItems < ActiveRecord::Migration
  def change
    create_table :report_items do |t|
      t.string :name
      t.integer :quantity
      t.integer :percentage
      t.integer :parent_id

      t.timestamps null: false
    end
  end
end
