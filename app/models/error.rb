class Error < ApplicationRecord
  require 'rdf/vocab'

  def to_rdf
    graph = RDF::Graph.new
    error_uri = RDF::URI("http://example.org/errors/#{id}")

    graph << [error_uri, RDF::URI("http://example.org/vocab#description"), RDF::Literal(description)]
    graph << [error_uri, RDF::URI("http://example.org/vocab#code"), RDF::Literal(code)]

    graph << [error_uri, RDF::URI("http://www.w3.org/2002/07/owl#sameAs"), error_uri]

    graph
  end
end
