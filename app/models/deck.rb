class Deck < ApplicationRecord
  belongs_to :user
  belongs_to :link_theme
  belongs_to :deck_theme
  
  has_many :like_decks, foreign_key: 'deck_id' , dependent: :destroy
  has_many :users, through: :like_decks
  
  has_one_attached :image
end
