class LikeDecksController < ApplicationController
  before_action :authenticate_user!

  def index
    @deck_themes=DeckTheme.all
    @link_themes=LinkTheme.all
     if params[:deck_theme].present?&&params[:link_theme].present?
      @like_decks= current_user.likedecks.where(deck_theme_id: params[:deck_theme],link_theme_id: params[:link_theme] ).page(params[:page]).per(25).order('created_at DESC')
    elsif params[:deck_theme].present?
      @like_decks= current_user.likedecks.where(deck_theme_id: params[:deck_theme]).page(params[:page]).per(25).order('created_at DESC')
    elsif params[:link_theme].present?  
      @like_decks= current_user.likedecks.where(link_theme_id: params[:link_theme]).page(params[:page]).per(25).order('created_at DESC')
    else
      @like_decks=current_user.likedecks.page(params[:page]).per(25).order('created_at DESC')
    end

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
