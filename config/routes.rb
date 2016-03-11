Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  resources :users
  resources :registered_applications do
    resources :events, only: [:show]
  end

  get 'welcome/index'

  get 'welcome/about'

end
