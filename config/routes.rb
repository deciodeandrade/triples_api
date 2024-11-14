Rails.application.routes.draw do
  resources :incidents, only: [] do
    collection do
      get 'execute_sparql_query'
    end
  end
end
