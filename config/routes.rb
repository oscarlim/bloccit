Bloccit::Application.routes.draw do
  
  get "comments/create"

  get "comments/index"

  get "comments/new"

  get "comments/show"

  get "comments/edit"

  devise_for :users
  
  resources :topics do  
    resources :posts, except: [:index] do
      resources :comments, only: [:create]
    end
  end
  
  match "about" => 'welcome#about', via: :get
  root :to => 'welcome#index'
end
