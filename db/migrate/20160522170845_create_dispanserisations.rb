class CreateDispanserisations < ActiveRecord::Migration
  def change
    create_table :dispanserisations do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.references :diagnosis, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
