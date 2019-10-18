class DecksController < ApplicationController

  before_action :authenticate_user!, except: [:index,:search]
  
  def new
    @deck = Deck.new
    @deck_themes = DeckTheme.all
    @link_themes = LinkTheme.all
  end
  
  def index
    @deck_themes=DeckTheme.all
    @link_themes=LinkTheme.all
     if params[:deck_theme].present?&&params[:link_theme].present?
      @decks= Deck.where(deck_theme_id: params[:deck_theme],link_theme_id: params[:link_theme] ).page(params[:page]).per(25)
    elsif params[:deck_theme].present?
      @decks= Deck.where(deck_theme_id: params[:deck_theme]).page(params[:page]).per(25)
    elsif params[:link_theme].present?  
      @decks= Deck.where(link_theme_id: params[:link_theme]).page(params[:page]).per(25)
    else
      @decks = Deck.page(params[:page]).per(25)
    end

  end
  
  def popular_deck
    @deck_themes=DeckTheme.all
    @link_themes=LinkTheme.all
    #いいねランキング
    deck_fav=Deck.all
    @deck_favs=deck_fav.order('favorite_num DESC').limit(25)
  end
  
  def trend_deck
    @deck_themes=DeckTheme.all
    @link_themes=LinkTheme.all
    #閲覧数ランキング
    @deck_pvs=Deck.order('impressions_count DESC').limit(25)
  end
  
  def show
    @deck = Deck.find(params[:id])
    @user = @deck.user

    impressionist(@deck, nil, :unique => [:session_hash])
  #  @decks=@deck.impressionist_count

  end
  
  def search
    @deck_themes=DeckTheme.all
    @link_themes=LinkTheme.all
     if params[:deck_theme].present?&&params[:link_theme].present?
      @decks= Deck.where(deck_theme_id: params[:deck_theme],link_theme_id: params[:link_theme] ).page(params[:page]).per(25)
    elsif params[:deck_theme].present?
      @decks= Deck.where(deck_theme_id: params[:deck_theme]).page(params[:page]).per(25)
    elsif params[:link_theme].present?  
      @decks= Deck.where(link_theme_id: params[:link_theme]).page(params[:page]).per(25)
    else
      @decks = Deck.all.page(params[:page]).per(25)
    end
    @deck_searchs = Deck.search(params[:search]).page(params[:page]).per(25)
  end
  
  
  def create
    deck = Deck.new(deck_params)
    deck.user_id = current_user.id
    if deck.save
      redirect_to edit_user_path(current_user.id)
    else
      redirect_to new_deck_path,notice:"必須部分を入力してください"
      
    end
  end
  
  def edit
    @deck=Deck.find(params[:id])
  end
  
  def destroy
    deck=Deck.find(params[:id])
    user=current_user
    deck.destroy
    redirect_to edit_user_path(user)
  end
  
  def edit_deck_name
    deck=Deck.find(params[:id])
    deck.update(deck_name_params)
    redirect_to edit_deck_path(deck)
  end
  
  def edit_deck_comment
    deck=Deck.find(params[:id])
    deck.update(deck_comment_params)
    redirect_to edit_deck_path(deck)
  end
  
  private
    def deck_params
      params.require(:deck).permit(:link_theme_id,:deck_theme_id,:deck_name,:deck_detail,:url,:image)
    end
  
    def deck_name_params
      params.require(:deck).permit(:deck_name)
    end
  
    def deck_comment_params
      params.require(:deck).permit(:deck_detail)
    end
end
