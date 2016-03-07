class Consultation < ActiveRecord::Base
	self.table_name = 'consultations'

	belongs_to :visit
    belongs_to :specialist
end
