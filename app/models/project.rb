class Project < ActiveRecord::Base
	belongs_to :user
	has_many :pledges
	belongs_to :category

	validates_presence_of :title, :summary, :description, :image_url, :goal

	has_attached_file :image
	has_attached_file :resource




	def self.search(search)
		if search 
			where(["title LIKE?", "%#{search}%"])
		else
			all
		end
	end


end
