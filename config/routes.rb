Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'api/v1/accounts#index'

  namespace :api do
    namespace :v1 do
      post '/auth/login', to: 'authentication#login'
      resources :users
      resources :accounts
    end
  end

end
