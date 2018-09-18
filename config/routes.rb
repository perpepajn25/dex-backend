Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :users, only: :create
      resources :decks
      resources :cards
      post '/login', to: 'auth#login'
      get '/reauth', to: 'auth#reauth'
      get '/public_decks', to: 'decks#public'
    end
  end

end
