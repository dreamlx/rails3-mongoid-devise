Rails3MongoidDevise::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users do
    collection do
      get :feed
    end
  end


  namespace :api do
    namespace :v1 do
      get '/media/popular' => 'media#popular'
      get '/oauth/connect' => 'oauth#connect'
      get '/oauth/callback' => 'oauth#callback'
    end
  end
end