Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  resources :users
  resources :registered_applications
  get 'welcome/index'

  get 'welcome/about'

end
