Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*' # Permite todas as origens

    resource '*',
      headers: :any, # Permite todos os cabeçalhos
      methods: [:get, :post, :put, :patch, :delete, :options, :head] # Permite todos os métodos HTTP
  end
end
