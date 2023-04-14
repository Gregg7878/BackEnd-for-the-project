# app.rb

require 'sinatra'
require 'json'
require_relative 'models/article'
require_relative 'models/comment'

# API endpoint to get a list of all articles
get '/articles' do
  content_type :json
  articles = Article.all
  articles.to_json
end

# API endpoint to get the details of a specific article
get '/articles/:id' do
  content_type :json
  id = params[:id].to_i
  article = Article.find(id)
  if article
    article.to_json
  else
    status 404
  end
end

# API endpoint to create a new article
post '/articles' do
  content_type :json
  data = JSON.parse(request.body.read)
  article = Article.new(data)
  if article.save
    status 201
    article.to_json
  else
    status 400
    { error: "Invalid parameters" }.to_json
  end
end

# API endpoint to update an existing article
put '/articles/:id' do
  content_type :json
  id = params[:id].to_i
  article = Article.find(id)
  if article
    data = JSON.parse(request.body.read)
    article.update(data)
    status 200
    article.to_json
  else
    status 404
  end
end

# API endpoint to delete an existing article
delete '/articles/:id' do
  id = params[:id].to_i
  article = Article.find(id)
  if article
    article.destroy
    status 204
  else
    status 404
  end
end

# API endpoint to get a list of comments for a specific article
get '/articles/:id/comments' do
  content_type :json
  id = params[:id].to_i
  article = Article.find(id)
  if article
    comments = article.comments
    comments.to_json
  else
    status 404
  end
end

# API endpoint to create a new comment for a specific article
post '/articles/:id/comments' do
  content_type :json
  id = params[:id].to_i
  article = Article.find(id)
  if article
    data = JSON.parse(request.body.read)
    comment = Comment.new(data)
    comment.article_id = article.id
    if comment.save
      status 201
      comment.to_json
    else
      status 400
      { error: "Invalid parameters" }.to_json
    end
  else
    status 404
  end
end
