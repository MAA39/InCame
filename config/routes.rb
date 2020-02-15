Rails.application.routes.draw do
  get 'users/edit'
  # get 'portfolios/index'
  # get 'portfolios/show'
  # get 'portfolios/new'
  # get 'portfolios/edit'
  
  root 'portfolios#index'
  resources :portfolios do
    resources :users
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
