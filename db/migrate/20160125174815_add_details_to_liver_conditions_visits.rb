class AddDetailsToLiverConditionsVisits < ActiveRecord::Migration
  def change
    add_column :liver_conditions_visits, :details, :string
  end
end
