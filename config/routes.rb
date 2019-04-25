Rails.application.routes.draw do
  root "homepages#index"
  resources :works
  resources :users
end