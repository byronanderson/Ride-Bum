RideBum::Application.routes.draw do
  resources :invitations

  resources :events do
    resources :invitations do
      get :send_emails, on: :collection
    end
  end

  devise_for :users
  root to: "pages#index"
  match "dashboard" => "dashboard#index"

end
