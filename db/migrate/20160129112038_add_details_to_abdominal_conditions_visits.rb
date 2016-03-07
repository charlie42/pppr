class AddDetailsToAbdominalConditionsVisits < ActiveRecord::Migration
  def change
    add_column :abdominal_conditions_visits, :details, :string
  end
end
