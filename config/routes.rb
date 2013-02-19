GistApp::Application.routes.draw do
  resources :users
  resources :gists do
    resource :favorite, :only => [:create, :destroy]
    #resources :taggings, :only => [:create, :destroy]
  end

  resources :favorites, :only => [:index]

  resource :sessions, :only => [:new, :create, :destroy]

  resource :taggings, :only => [:create, :destroy]

  resources :tags, :only => [:index]

  root :to => "gists#index"
end
