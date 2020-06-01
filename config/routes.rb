Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  get '/admin/stats', to: 'stats#index'

  root 'posts#index'

  namespace :admin do 
    resources :stats, only: [:index]
  end 

  get '/admin/authors/new', to: 'authors#new'
  get '/admin/authors/delete', to: 'authors#delete'
  get '/admin/author/create', to: 'authors#create'
  get '/admin/comment/moderate', to: 'comments#moderate'
end
