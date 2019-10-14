class DecksController < ApplicationController

  before_action :authenticate_user!, except: [:index]
  
  def new
    @deck = Deck.new
    @deck_themes = DeckTheme.all
    @link_themes = LinkTheme.all
  end
  
  def index
    @deck_themes=DeckTheme.all
    @link_themes=LinkTheme.all
     if params[:deck_theme].present?&&params[:link_theme].present?
      @decks= Deck.where(deck_theme_id: params[:deck_theme],link_theme_id: params[:link_theme] )
    elsif params[:deck_theme].present?
      @decks= Deck.where(deck_theme_id: params[:deck_theme])
    elsif params[:link_theme].present?  
      @decks= Deck.where(link_theme_id: params[:link_theme])
    else
      @decks = Deck.all
    end
  end
  
  def popular_deck
    @deck_themes=DeckTheme.all
    @link_themes=LinkTheme.all
    #いいねランキング
    deck_fav=Deck.all
    @deck_favs=deck_fav.order('favorite_num DESC')
  end
  
  def trend_deck
    @deck_themes=DeckTheme.all
    @link_themes=LinkTheme.all
    #閲覧数ランキング
    deck_pv=Deck.all
    @deck_pvs=deck_pv.order('impressions_count DESC').limit(10)
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
      @decks= Deck.where(deck_theme_id: params[:deck_theme],link_theme_id: params[:link_theme] )
    elsif params[:deck_theme].present?
      @decks= Deck.where(deck_theme_id: params[:deck_theme])
    elsif params[:link_theme].present?  
      @decks= Deck.where(link_theme_id: params[:link_theme])
    else
      @decks = Deck.all
    end
    @deck_searchs = Deck.search(params[:search])
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
      params.require(:deck).permit(:link_theme_id,:deck_theme_id,:deck_name,:deck_detail,:deck_status,:url,:image)
    end
end
