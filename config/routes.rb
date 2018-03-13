Rails.application.routes.draw do
  devise_for :users
  root "restuarants#index"
  resources :users, :ratings, :ingredients
  
  resources :restuarants do
   resources :dishes
  end
  post 'restuarants/:id/visit', to: 'restuarants#visit', as: 'visit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
