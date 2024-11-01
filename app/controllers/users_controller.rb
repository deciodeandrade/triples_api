class UsersController < ApplicationController
  def index
    users = User.all
    graph = RDF::Graph.new

    users.each do |user|
      user.to_rdf.each_statement do |statement|
        graph << statement
      end
    end

    # Renderizar o grafo em Turtle com URIs entre <>
    output = ""
    graph.each_statement do |statement|
      output += "<#{statement.subject}> <#{statement.predicate}> #{format_object(statement.object)} .\n"
    end

    render plain: output, content_type: 'text/turtle'
  end

  def rdf
    users = User.all
    graph = RDF::Graph.new

    users.each do |user|
      graph << user.to_rdf.statements
    end

    render plain: graph.dump(:rdfxml), content_type: 'application/rdf+xml'
  end

  def posts
    posts = Post.includes(:user).all
    graph = RDF::Graph.new

    posts.each do |post|
      post_uri = RDF::URI("http://example.org/posts/#{post.id}")
      graph << [post_uri, RDF::Vocab::DC.title, RDF::Literal(post.title)]
      graph << [post_uri, RDF::Vocab::DC.description, RDF::Literal(post.body)]
      graph << [post_uri, RDF::Vocab::FOAF.maker, RDF::URI("http://example.org/users/#{post.user.id}")]
    end

    output = ""
    graph.each_statement do |statement|
      output += "<#{statement.subject}> <#{statement.predicate}> #{format_object(statement.object)} .\n"
    end

    render plain: output, content_type: 'text/turtle'
  end

  private

  # Formata o objeto corretamente, com <> para URIs e aspas para literais
  def format_object(object)
    object.uri? ? "<#{object}>" : "\"#{object}\""
  end
end
