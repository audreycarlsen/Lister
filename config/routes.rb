require 'resque/server'

Lister::Application.routes.draw do

  mount Resque::Server, :at => "/resque"
  
  root 'lists#index'

  get 'session/new'   => 'session#new',     as: 'sign_in'
  post 'session'      => 'session#create',  as: 'create_session'
  get 'session'       => 'session#destroy', as: 'sign_out'

  resources :lists
  resources :items
  resources :users

  get 'users/new'     => 'users#new',       as: 'sign_up'

  get 'my_lists'      => 'lists#my_lists',  as: 'my_lists'

  if Rails.env == "test"
    get 'dummy/test_current_user' => 'dummy#test_current_user'
  end

end
