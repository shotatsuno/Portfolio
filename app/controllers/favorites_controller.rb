class FavoritesController < ApplicationController
  
  before_action :authenticate_user!
  
  def create
    @deck = Deck.find(params[:deck_id])
    favorite = current_user.favorites.new(deck_id: @deck.id)
    @deck.favorite_num += 1
    @deck.save
    favorite.save
    render 'index.js.erb'
  end
  
  def destroy
    @deck = Deck.find(params[:deck_id])
    favorite = current_user.favorites.find_by(deck_id: @deck.id)
    @deck.favorite_num -= 1
    @deck.save
    favorite.destroy
    render 'index.js.erb'
  end
  
end
