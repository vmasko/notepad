class User < ActiveRecord::Base

	has_secure_password

	has_many :pads
	attr_accessible :name, :surname, :nickname, :email, :password, :password_confirmation

end
