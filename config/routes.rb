Rails.application.routes.draw do
  
  root "home#index"  
  resources :comments
  resources :tags
  resources :notes
  devise_for :users   
  resources :users, only: [:index, :show]    
   
end

# The priority is based upon order of creation: first created -> highest priority.
# See how all your routes lay out with "rake routes".

# You can have the root of your site routed with "root"
# root 'welcome#index'
