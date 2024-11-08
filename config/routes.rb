Rails.application.routes.draw do
  resources :users, only: [:index] do
    collection do
      get 'rdf'
      get 'posts'
      get 'rdf_test'
    end
  end
end
