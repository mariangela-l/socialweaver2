class Project < ActiveRecord::Base
	belongs_to :user
	has_many :pledges
	belongs_to :category

	validates_presence_of :title, :summary, :description, :image, :goal, :user_id

	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	has_attached_file :resource
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/



	#has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  

	#gets all the pledges and sums up total amount.
	def total_amount
		pledges.map(&:amount).inject(0, :+)
	end


	def days_to_go
		(self.expiration_date.to_date - Date.today).to_i
	end


	def self.search(search)
		if search 
			where(["title LIKE?", "%#{search}%"])
		else
			all
		end
	end

private

	def start_project
		self.expiration_date = 3.months.from_now
	end




end
