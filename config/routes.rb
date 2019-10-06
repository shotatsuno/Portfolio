Rails.application.routes.draw do
  devise_for :admins, :controllers => {
    :registrations => 'admins/registrations',
    :sessions => 'admins/sessions'
  }
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  
  resources :users, only: [:index, :show, :edit] do
    member do
      patch 'edit_profile_image' => 'users#edit_profile_image'
      patch 'edit_introduction' => 'users#edit_introduction'
    end
  end
  
  resources :like_decks, only: [:index, :create, :destroy] 
    
  
  resources :admins, only: [:index, :new] 
  get 'add_deck_theme' => 'admins#add_deck_theme' 
  get 'add_link_theme' => 'admins#add_link_theme'
  post 'register_deck_theme' => 'admins#register_deck_theme'
  post 'register_link_theme' => 'admins#register_link_theme'
  
  resources :decks do
    resource :favorites, only: [:create, :destroy]
  end
  get 'popular_deck' => 'decks#popular_deck'
  get 'trend_deck' => 'decks#trend_deck'
  
  get 'how_to_upload' => 'extra#how_to_upload'
  
  root 'decks#index'

end
