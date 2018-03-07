Rails.application.routes.draw do
  devise_for :users
  root "restuarants#index"
  resources :users, :restuarants, :dishes, :ratings, :ingredients
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
