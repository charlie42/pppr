class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :visits, :postural_pose_options_id, :postural_pose_option_id
  end
end
