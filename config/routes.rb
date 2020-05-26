Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

   # `scope` allows us to prefix a block of routes under one grouping
  #  scope '/admin', module: 'admin'do
  #   resources :stats, only: [:index]
  # end
  # Using scope, module gives us`stats_path` 

# Rails gives us a shortcut here. When we want to route with a module
# and_ use that module's name as the URL prefix, we can use the `namespace`
# method instead of `scope, module`

  namespace :admin do
    resources :stats, only: [:index]
  end
  # Using namespace gives us `admin_stats_path` 

  resources :posts, only: %i[index show new create edit update]

  root 'posts#index'
end
