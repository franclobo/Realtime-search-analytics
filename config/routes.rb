Rails.application.routes.draw do
  resources :searches, only: [:index, :create, :destroy]
  delete 'searches/:id', to: 'searches#destroy', as: 'destroy_search'
  post 'searches/delete_all', to: 'searches#delete_all', as: 'delete_all_searches'
  root 'searches#index'
end
