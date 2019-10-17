class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :deck
  
  validates :comment,
  presence: true,
  length: {maximum: 300}
  
end
