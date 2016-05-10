class AddDetailsToAnamnesisVisits < ActiveRecord::Migration
  def change
    add_column :anamnesis_visits, :details, :string
  end
end
