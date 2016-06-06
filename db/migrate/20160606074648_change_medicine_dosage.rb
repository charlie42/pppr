class ChangeMedicineDosage < ActiveRecord::Migration
  def self.up
    change_table :medications do |t|
      t.change :dosage, :string
    end
  end
  def self.down
    change_table :medications do |t|
      t.change :dosage, :integer
    end
  end
end
