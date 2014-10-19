class AsignateNorma < ActiveRecord::Base
	belongs_to :user
	belongs_to :norma
end
