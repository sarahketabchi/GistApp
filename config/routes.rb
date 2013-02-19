GistApp::Application.routes.draw do
  resources :users
  resources :gists do
    resource :favorite, :only => [:create, :destroy]
  end

  resources :favorites, :only => [:index]

  resource :sessions, :only => [:new, :create, :destroy]

  root :to => "gists#index"
end
