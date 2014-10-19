class Norma < ActiveRecord::Base
	has_many :asignate_normas
	has_many :users, through: :asignate_normas
end
