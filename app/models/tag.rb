class Tag < ActiveRecord::Base
	has_many :asignate_tags
	has_many :discutions, through: :asignate_tags
end
