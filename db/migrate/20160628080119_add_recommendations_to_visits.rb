class AddRecommendationsToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :recommendations, :string
  end
end
