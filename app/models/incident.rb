class Incident < ApplicationRecord
  require 'rdf/vocab'

  def to_rdf
    graph = RDF::Graph.new
    incident_uri = RDF::URI("http://example.org/incidents/#{id}")

    graph << [incident_uri, RDF::URI("http://example.org/vocab#robot"), RDF::Literal(robot)]
    graph << [incident_uri, RDF::URI("http://example.org/vocab#treatmentId"), RDF::Literal(treatment_id)]
    graph << [incident_uri, RDF::URI("http://example.org/vocab#status"), RDF::Literal(status)]
    graph << [incident_uri, RDF::URI("http://example.org/vocab#recovery"), RDF::Literal(recovery)]
    graph << [incident_uri, RDF::URI("http://example.org/vocab#dateTime"), RDF::Literal(date_time)]
    graph << [incident_uri, RDF::URI("http://example.org/vocab#percentage"), RDF::Literal(percentage)]
    graph << [incident_uri, RDF::URI("http://example.org/vocab#errorCode"), RDF::Literal(error_code)]

    graph
  end
end
