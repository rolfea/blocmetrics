Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  resources :users
  resources :registered_applications do
    resources :events, only: [:show]
  end

  namespace :api, defaults: { format: :json } do
    match '/events', to: 'events#preflight', via: [:options]
    resources :events, only: [:create]
  end

  get 'welcome/index'

  get 'welcome/about'

end
