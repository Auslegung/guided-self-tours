Rails.application.routes.draw do
  get 'markers/show'

  get 'markers/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:create, :show, :update, :index, :destroy] do
    collection do
      post '/login', to: 'users#login'
    end # end collection do

    member do
      post '/add_marker', to: 'users#add_marker'
      patch '/update_marker/:marker_id', to: 'users#update_marker'
      delete 'remove_marker/:marker_id', to: 'users#remove_marker'
    end # end member do
  end # end resources do

  resources :markers, only: [:show, :index] do

  end

end # end draw do
