class User < ApplicationRecord
  before_save { self.email = email.downcase }
  
  is_impressionable
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :decks, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :inquiries, dependent: :destroy
  
  validates :introduction,
  length: { maximum: 300}
  
  validates :user_name,
  length: { maximum: 11},
  presence: true,
  uniqueness: true
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, {presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }}
  
  #画像
  attachment :profile_image
  has_one_attached :image
  
  #お気に入り機能
  has_many :like_decks
  has_many :likedecks, through: :like_decks, source: :deck
  
  #フォロワー機能
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user
  
#フォロワー機能メソッド
  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end
  
  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end
  
  def following?(other_user)
    self.followings.include?(other_user)
  end
  
#お気に入り機能メソッド
  
  #お気に入り追加
  def like(deck)
    like_decks.find_or_create_by(deck_id: deck.id)
  end
  
  #お気に入り削除
  def unlike(deck)
    like_deck = like_decks.find_by(deck_id: deck.id)
    like_deck.destroy if like_deck
  end
  
  #お気に入り判定
  def likedeck?(deck)
    self.likedecks.include?(deck)
  end
  
  #検索機能
   def self.search_user(search)
    return User.all unless search
    User.where(['user_name LIKE ?',"%#{search}%"])
   end
  
    #検索機能
  def search_following(search)
    return self.followings.all unless search
    self.followings.where(['user_name LIKE ?',"%#{search}%"])
  end
  
  
end


