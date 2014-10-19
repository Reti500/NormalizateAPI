class User < ActiveRecord::Base
  authenticates_with_sorcery!
  
  has_many :asignate_normas
  has_many :normas, through: :asignate_normas
  has_many :discutions
  has_many :comments

  has_many :asignate_conversations
  has_many :conversations, through: :asignate_conversations

  belongs_to :role

  
  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, uniqueness: true
end
