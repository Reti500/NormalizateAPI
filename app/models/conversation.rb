class Conversation < ActiveRecord::Base
	has_many :asignate_conversations
	has_many :users, through: :asignate_conversations
end
