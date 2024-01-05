Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/show'
  get 'articles/new'
  get 'articles/edit'
  get 'articles/create'
  get 'articles/update'
  get 'articles/destroy'
  get 'searches/index'
  get 'searches/show'
  get 'searches/new'
  get 'searches/edit'
  get 'searches/create'
  get 'searches/update'
  get 'searches/destroy'
  get 'article/index'
  get 'article/show'
  get 'article/new'
  get 'article/edit'
  get 'article/create'
  get 'article/update'
  get 'article/destroy'
  get 'search/index'
  get 'search/show'
  get 'search/new'
  get 'search/edit'
  get 'search/create'
  get 'search/update'
  get 'search/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
