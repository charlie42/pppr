class AddPosturalPoseToVisits < ActiveRecord::Migration
  def change
    add_reference :visits, :postural_pose_option, index: true, foreign_key: true
  end
end
