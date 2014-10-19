class AsignateTag < ActiveRecord::Base
	belongs_to :discution
	belongs_to :tag
end
