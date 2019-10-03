Rails.application.routes.draw do
  devise_for :admins, :controllers => {
    :registrations => 'admins/registrations',
    :sessions => 'admins/sessions'
  }
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  
  resources :admins, only: [:index, :new] 
  get 'add_deck_theme' => 'admins#add_deck_theme' 
  get 'add_link_theme' => 'admins#add_link_theme'
  post 'register_deck_theme' => 'admins#register_deck_theme'
  post 'register_link_theme' => 'admins#register_link_theme'
  

end
