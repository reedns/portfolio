Rails.application.routes.draw do
  root to: 'welcome#index'

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'logout', to: 'devise/sessions#destroy'
    get 'signup', to: 'devise/registrations#new'
  end

  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }

  resources :articles do
    resources :comments, only: [:create, :update]
  end

  resources :projects
end
