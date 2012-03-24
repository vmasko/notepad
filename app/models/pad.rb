class Pad < ActiveRecord::Base

	belongs_to :user
	has_many :notes, :dependent => :destroy

	validates :title, :presence => true, :length => { :maximum => 45 }
	validates :description, :length => { :maximum => 45 }

end
