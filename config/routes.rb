Rails.application.routes.draw do
  devise_for :users
  resources :battles
  resources :battle_members

  authenticated :user do
    root :to => "battles#index", as: :authenticated_root
  end
  devise_scope :user do
    root :to => "devise/sessions#new"
  end
 end
