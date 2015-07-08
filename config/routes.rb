Rails.application.routes.draw do

  #match is same as get

  match "/favourites/add/:note_id", :controller => "favorites", :action => "pick_album", :as => "add_favorite", via: [:get]
  match "/favourites/add/:album_id/:note_id", :controller => "favorites", :action => "add_to_album", :as => "add_favorite_to_album", via: [:get]

  resources :favorites
  # root "notes#index"  
  root 'static_pages#home'
  get 'static_pages/about'           
  resources :comments
  resources :notes
  resources :tags
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  resources :users, only: [:index, :show] 
  resources :notes
end



# The priority is based upon order of creation: first created -> highest priority.
# See how all your routes lay out with "rake routes".

# You can have the root of your site routed with "root"
# root 'welcome#index'
