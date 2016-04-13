class MakeFromInVisitAReference < ActiveRecord::Migration
  def change
  	remove_column :visits, :from
  	add_reference :visits, :from, references: :specialists
  end
end
