Rails.application.routes.draw do
  resources :favorites
  # root "notes#index"  
  root 'static_pages#home'
  get 'static_pages/about'           
  resources :comments
  resources :tags
  resources :notes
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  resources :users, only: [:index, :show] 
  resources :favorite_notes    
end



# The priority is based upon order of creation: first created -> highest priority.
# See how all your routes lay out with "rake routes".

# You can have the root of your site routed with "root"
# root 'welcome#index'
