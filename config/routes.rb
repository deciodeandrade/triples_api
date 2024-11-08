Rails.application.routes.draw do
  resources :users, only: [:index] do
    collection do
      get 'rdf'
      get 'posts'
      get 'rdf_test'
      get 'rdf_test_2'
    end
  end

  get 'sparql/query', to: 'sparql#query'
  post 'sparql/query', to: 'sparql#query'
end
