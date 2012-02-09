RideBum::Application.routes.draw do

  devise_for :users
  resources :events

  root to: "pages#index"
  match "dashboard" => "dashboard#index"

end
