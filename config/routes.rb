Rails.application.routes.draw do
  resources :employees do
  	post 'assign' , on: :member
  	get 'list' ,on: :member
  end
  resources :companies do
  	post 'assign' ,on: :member
   get 'list' ,on: :member
  end
  devise_for :users
  root 'application#index'
  # get '/list' => 'companies#list'
  # get '/assign' => 'companies#assign'

  # get '/employees/list' => 'employees#list'
  # get '/employees/assign' => 'employees#assign'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
