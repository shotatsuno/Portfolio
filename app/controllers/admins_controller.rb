class AdminsController < ApplicationController
  def index
  end
  
  def new
    @link_themes = LinkTheme.all
    @deck_themes = DeckTheme.all
 
   
    
  end
  

  
  def add_deck_theme
     @deck_theme = DeckTheme.new
  end
  
  def add_link_theme
     @link_theme = LinkTheme.new
  end
  
  def register_deck_theme
    deck_theme = DeckTheme.new(add_deck_params)
    if deck_theme.save!
      redirect_to new_admin_path
    else 
      render :add_deck_theme
    end
  end
  
  def register_link_theme
    link_theme = LinkTheme.new(add_link_params)
    if link_theme.save!
      redirect_to new_admin_path
    else 
      render :add_link_theme
    end
  end
  
  
  def destroy
    deck_theme = DeckTheme.find(params[:id])
    deck_theme.destroy
  end
  
  
  private
  
  def add_deck_params
    params.require(:deck_theme).permit(:deck_theme)
  end
  
  def add_link_params
    params.require(:link_theme).permit(:link_theme)
  end
  
end