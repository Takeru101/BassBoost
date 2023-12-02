Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "picks/top" => "picks#top"
  get "picks/kiso" => "picks#kiso"

  resources :picks do

    resources :comments, only: [:create]

  end

  resources :pickups
  root 'picks#index'
end