class User < ApplicationRecord
  require 'rdf/vocab'

  def to_rdf
    # Cria um grafo RDF para o usuário
    graph = RDF::Graph.new
    user_uri = RDF::URI("http://example.org/users/#{id}")

    # Adiciona triplas para o nome e email
    graph << [user_uri, RDF::Vocab::FOAF.name, RDF::Literal(name)]
    graph << [user_uri, RDF::Vocab::FOAF.mbox, RDF::URI("mailto:#{email}")]

    graph
  end
end
