Rails.application.routes.draw do
  scope "/api/v1" do
    root to: 'artists#index'
    resources :artists

    get '/genres/list', to: 'genres#list'
    get '/genres/:name/random_song', to: 'genres#random_song'

    namespace :artists do
      get ':id/albums', to: 'albums#show'
    end

    resources :albums do
      resources :songs
    end
  end
end
