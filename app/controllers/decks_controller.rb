class DecksController < ApplicationController
  def new
    @deck = Deck.new
    @deck_themes = DeckTheme.all
    @link_themes = LinkTheme.all
  end
  
  def show
    @decks = Deck.all
  end
  
  
  def create
    deck = Deck.new(deck_params)
    deck.user_id = current_user.id
    if deck.save!
      redirect_to edit_user_path(current_user.id)
    else
      render :new
    end
  end
  
  
  
  private
    def deck_params
      params.require(:deck).permit(:linktheme_id,:decktheme_id,:deck_name,:deck_detail,:deck_status,:image)
    end
end
