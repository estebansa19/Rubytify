Rails.application.routes.draw do
  scope "/api/v1" do
    root to: 'artists#index'
    resources :artists

    resources :genres do
      get '/random_song', to: 'genres#random_song'
    end

    namespace :artists do
      get ':id/albums', to: 'albums#show'
    end

    resources :albums do
      resources :songs
    end
  end
end
