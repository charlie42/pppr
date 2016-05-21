class CreateSocialBenefits < ActiveRecord::Migration
  def change
    create_table :social_benefits do |t|
      t.integer :code
      t.string :name

      t.timestamps null: false
    end
  end
end
