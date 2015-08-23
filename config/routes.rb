Rails.application.routes.draw do
  resources :todos do
    resources :items, only: [:create, :destroy] do
      member do
        patch :mark_as_complete
      end
    end
  end
  root 'todos#index'
end
