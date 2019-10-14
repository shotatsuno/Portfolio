class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :follow, class_name: 'User'
  
  validates :user_id, presence: true
  validates :follow_id, presence: true
  
  #検索機能
  def self.search_following(search)
    return current_user.followings.all unless search
    current_user.followings.where(['user_name LIKE ?',"%#{search}%"])
  end
  
end
