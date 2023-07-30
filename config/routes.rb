Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :questions, only: [:index]
      resources :clients, only: [:create]
      resources :client_answers, only: [:create] do
        collection do
          get :result
        end
      end
    end
  end
end
