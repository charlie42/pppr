class CreateConsultations < ActiveRecord::Migration
  def change
    create_table :consultations do |t|

      t.timestamps null: false
    end
  end
end
