class DecksController < ApplicationController
  
  before_action :authenticate_user!, except: [:index]
  
  def new
    @deck = Deck.new
    @deck_themes = DeckTheme.all
    @link_themes = LinkTheme.all
  end
  
  def index
    @decks = Deck.all
  end
  
  def show
    @deck = Deck.find(params[:id])
    @user = @deck.user
    
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
      params.require(:deck).permit(:link_theme_id,:deck_theme_id,:deck_name,:deck_detail,:deck_status,:image)
    end
end
