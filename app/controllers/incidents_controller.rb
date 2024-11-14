require 'rubygems'
require 'sparql/client'
require 'rdf/turtle'
require 'rdf/vocab'

class IncidentsController < ApplicationController
  def execute_sparql_query
    query = params[:query]

    client = SPARQL::Client.new(data_graph)
    results = client.query(query)
  
    render json: results.to_json, status: :ok
  rescue => e
    puts e.message
    render json: { error: e.message }, status: :unprocessable_entity
  end

  private

  def data_graph
    graph = RDF::Graph.new
  
    [Incident, Error, Robot].each do |model|
      model.find_each do |record|
        record.to_rdf.each_statement { |statement| graph << statement }
      end
    end
  
    graph
  end
end
