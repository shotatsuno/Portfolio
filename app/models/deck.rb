class Deck < ApplicationRecord
  
  is_impressionable counter_cache: true
  
  belongs_to :user
  belongs_to :link_theme
  belongs_to :deck_theme

  has_many :comments
  
  #いいね
  has_many :favorites, dependent: :destroy
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  #ActiveStorage
  has_one_attached :image
  
  #お気に入り機能
  has_many :like_decks, foreign_key: 'deck_id', dependent: :destroy
  has_many :users, through: :like_decks
  
end
