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
  resources :relationships, only: [:create, :destroy, :index]
  
  resources :admins, only: [:index, :new] 
  get 'add_deck_theme' => 'admins#add_deck_theme' 
  get 'add_link_theme' => 'admins#add_link_theme'
  post 'register_deck_theme' => 'admins#register_deck_theme'
  post 'register_link_theme' => 'admins#register_link_theme'
  delete 'destroy_deck_theme/:id' => 'admins#destroy_deck_theme', as: 'destroy_deck_theme'
  delete 'destroy_link_theme/:id' => 'admins#destroy_link_theme', as: 'destroy_link_theme'
  
  resources :admin_users, only: [:index, :show]
  get 'admin_search_user' => 'admin_users#admin_search_user'
  
  resources :inquiries, only: [:new, :create]
  resources :admin_inquiries, only: [:index, :show, :destroy]
  
  
  resources :decks do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy,:new]
    member do
      patch 'edit_deck_name' => 'decks#edit_deck_name'
      patch 'edit_deck_comment' => 'decks#edit_deck_comment'
    end
  end
  
  get 'search' => 'decks#search'
  get 'search_user' => 'users#search_user'
  get 'search_following' => 'relationships#search_following'
  get 'popular_deck' => 'decks#popular_deck'
  get 'trend_deck' => 'decks#trend_deck'
  
  #エクストラ
  get 'how_to_upload' => 'extra#how_to_upload'
  get 'how_to_url_upload' => 'extra#how_to_url_upload'
  get 'about' => 'extra#about'
  
  
  root 'decks#index'

end
