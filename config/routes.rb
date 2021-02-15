Rails.application.routes.draw do
  resources :create_post_tags
  resources :posts do
    resources :comments
  end

  resources :users
  resources :tags

  post '/login',    to: 'sessions#create'
  post '/logout',   to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'

  post '/signup', to: 'users#create'

  post '/posts/:id/comments', to: 'comments#create'
  delete '/comments', to: 'comments#destroy'
  delete '/posts', to: 'posts#destroy'
  delete '/tags', to: 'tags#destroy'
  delete '/users', to: 'users#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
