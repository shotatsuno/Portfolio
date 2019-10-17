class Deck < ApplicationRecord
  
  is_impressionable counter_cache: true
  
  belongs_to :user
  belongs_to :link_theme
  belongs_to :deck_theme

  has_many :comments
  
  #バリデーション
  validates :deck_detail,
  length: { maximum: 300}
  
  validates :deck_name,
  presence: true
  

  
  
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
  
  #検索機能
  def self.search(search)
    return Deck.all unless search
    Deck.where(['deck_name LIKE ?',"%#{search}%"])
  end
  
  #週間ランキング機能
  scope :week, -> { where("created_at > ?",Time.zone.now-1.week) }
  
end

