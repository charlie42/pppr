json.array!(@postural_pose_options) do |postural_pose_option|
  json.extract! postural_pose_option, :id, :name
  json.url postural_pose_option_url(postural_pose_option, format: :json)
end
