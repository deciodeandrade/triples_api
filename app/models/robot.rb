class Robot < ApplicationRecord
  require 'rdf/vocab'

  def to_rdf
    graph = RDF::Graph.new
    robot_uri = RDF::URI("http://example.org/robots/#{id}")

    graph << [robot_uri, RDF::URI("http://example.org/vocab#siteName"), RDF::Literal(site_name)]
    graph << [robot_uri, RDF::URI("http://example.org/vocab#siteId"), RDF::Literal(site_id)]
    graph << [robot_uri, RDF::URI("http://example.org/vocab#robotId"), RDF::Literal(robot_id)]
    graph << [robot_uri, RDF::URI("http://example.org/vocab#displayName"), RDF::Literal(display_name)]
    graph << [robot_uri, RDF::URI("http://example.org/vocab#type"), RDF::Literal(robot_type)]

    graph
  end
end
