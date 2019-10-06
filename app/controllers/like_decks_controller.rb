class LikeDecksController < ApplicationController
  
  def index
    @like_decks=current_user.likedecks
  end
  
  
  
  def create
    deck = Deck.find(params[:deck_id])
    current_user.like(deck)
    flash[:success] = 'お気に入り登録をしました。'
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    deck = Deck.find(params[:id])
    current_user.unlike(deck)
    flash[:success] = 'お気に入り登録を解除しました'
    redirect_back(fallback_location: root_path)
  end
end
