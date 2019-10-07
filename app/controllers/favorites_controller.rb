class FavoritesController < ApplicationController
  def create
    @deck = Deck.find(params[:deck_id])
    favorite = current_user.favorites.new(deck_id: @deck.id)
    favorite.save
    redirect_to deck_path(@deck.id)
  end
  
  def destroy
    @deck = Deck.find(params[:deck_id])
    favorite = current_user.favorites.find_by(deck_id: @deck.id)
    favorite.destroy
    redirect_to deck_path(@deck.id)
  end
  
end
