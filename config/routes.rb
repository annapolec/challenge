Rails.application.routes.draw do
  devise_for :users
  
  resources :battles do
     resources :challenges
     get "ranking" => "battle_ranking#show"
  end

  resources :battle_members
  resources :groups
  resources :group_users
  resources :challenge_members 

  get "ranking" => "ranking#show"

  authenticated :user do
    root :to => "battles#index", as: :authenticated_root
  end
  
  devise_scope :user do
    root :to => "devise/sessions#new"
  end
 end
