class User < ActiveRecord::Base

	has_secure_password

	has_many :pads
	attr_accessible :name, :email, :password, :password_confirmation

	validates :name, :presence => true, :length => { :maximum => 30 }
	validates :password, :presence => true, :length => { :minimum => 6 }
	valid_email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, :presence => true, :format => { :with => valid_email_regex },
										:uniqueness => { :case_sensitive => false }
end
