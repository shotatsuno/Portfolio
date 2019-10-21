class DeckTheme < ApplicationRecord
  acts_as_paranoid
  has_many :decks, dependent: :destroy
end
