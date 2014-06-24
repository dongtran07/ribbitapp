class User < ActiveRecord::Base
	before_validation :prep_email
	before_save :create_gravatar
	#attr_accessible :avatar_url, :email, :name, :password, :password_confirmation, :username
	has_secure_password
	has_many :ribbits
	has_many :flower_relationships, class_name:"Relationship", foreign_key: "flowed_id"
	has_many :flowed_relationships, class_name:"Relationship", foreign_key: "flower_id"
	has_many :flowers, through: :flower_relationships
	has_many :floweds, through: :flowed_relationships
  	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :name, presence: true
	validates :username, uniqueness:true, presence: true
	validates :email, uniqueness: true, presence:true, format: {with: VALID_EMAIL_REGEX }

	def flowing? user
    self.floweds.include? user
	end
	def flow user
		Relationship.create(flower_id: self.id, flowed_id: user.id)
	end
	
	private
	def prep_email
		self.email = self.email.strip.downcase if self.email
	end
	def create_gravatar
		self.avatar_url = "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(self.email)}?s=50"
	end

end
