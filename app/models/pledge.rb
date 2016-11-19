class Pledge < ActiveRecord::Base
	belongs_to :project
	belongs_to :user

	before_validation :generate_uuid!, :on => :create
	validates_presence_of :amount,:user_id

	private

	def generate_uuid!
		begin
			self.uuid = SecureRandom.hex(16)
		end while Pledge.find_by(:uuid => self.uuid).present? # to avoid duplication on the database
	end
end
