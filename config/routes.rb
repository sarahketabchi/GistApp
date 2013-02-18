GistApp::Application.routes.draw do
  resources :users
  resources :gists
  resource :sessions, :only => [:new, :create, :destroy]

  root :to => "gists#index"
end
