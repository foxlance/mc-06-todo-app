Rails.application.routes.draw do
  resources :todos do
    resources :items, only: [:create, :destroy]
  end
  root 'todos#index'
end
