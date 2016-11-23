class Pledge < ActiveRecord::Base
	belongs_to :project
	belongs_to :user

	before_validation :generate_uuid!, :on => :create
	validates_presence_of :amount,:user_id
	#after_create :check_if_funded

	private


#changes the project's status to "funded" if the total amount pledged is 
#greater or equal to the project's goal.
	#def check_if_funded 
	#	project.funded! if project.total_amount >= project.goal
	#end

	def generate_uuid!
		begin
			self.uuid = SecureRandom.hex(16)
		end while Pledge.find_by(:uuid => self.uuid).present? # to avoid duplication on the database
	end
end
