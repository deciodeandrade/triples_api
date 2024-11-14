Rails.application.routes.draw do
  resources :users, only: [:index] do
    collection do
      get 'rdf'
      get 'posts'
      get 'execute_sparql_query'
    end
  end

  resources :incidents, only: [] do
    collection do
      get 'execute_sparql_query'
    end
  end
end
