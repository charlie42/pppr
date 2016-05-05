module ActsAsTaggableOn
  	class Tag < ::ActiveRecord::Base
		def validates_name_uniqueness?
	  		false
		end
	end
end