class Note < ActiveRecord::Base

	belongs_to :pad

	validates :content, :presence => true

end
