class Discution < ActiveRecord::Base
	belongs_to :user

	has_many :comments
	has_many :asignate_tags
	has_many :tags, through: :asignate_tags
end
