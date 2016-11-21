class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :projects
  has_many :pledges

  validates_presence_of :email


  def self.from_omniauth(auth)where(provider: auth.provider, uid:auth.uid).first_or_create do |user|
  	user.provider = auth.provider
  	user.email=auth.info.email
  	user.name=auth.info.name
  	user.password=Devise.friendly-token[0,20]
  	user.image=auth.info.image
  end

  def self.new_with_sessions(params, session) #check if there is a session with devise user attributes
  	if session[ "devise.user_attributes" ]
  		new(session[ "devise.user_attributes" ], without_protection: true) do |user|
  			user.attributes = params
  			user.valid?
  			end
  		else
  			super
  		end
  end

  def password_required?
  	super && provider.blank?
  end
end
end
