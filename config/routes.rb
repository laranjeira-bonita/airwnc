Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :bathrooms do
    resources :bookings, only:[:new, :create]
    get "/bookings", to: "dashboard#wc_bookings"
  end
  
  resources :bookings, only:[:index, :show, :destroy]
  
  get "/owner_bookings", to: "dashboard#owner_bookings"
  get "/users/:id", to: "dashboard#show"
  patch "/users/:id/edit", to: "dashboard#update"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
