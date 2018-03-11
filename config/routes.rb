Rails.application.routes.draw do
  namespace :api do
    resources :monkeys do
      resources :items, only: [:create, :update, :destroy]
    end
  end

  resources :monkeys
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
