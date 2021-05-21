Rails.application.routes.draw do
  devise_for :users
  # root to: 'home#index'
  root to: 'rooms#home'
  
  get 'users/account' => 'users#show'
  get 'users/profile' => 'users#edit'
  post 'users/:id/update' => 'users#update'
  resources :users, only: [:account, :profile, :update]
  get 'rooms/posts' => 'rooms#index'
  # resources :rooms
  
  resources :rooms do
    get :home,   on: :collection
    get :search, on: :collection
  end
  
  resources :reservations

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
