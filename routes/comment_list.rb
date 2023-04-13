

class CommentList < Sinatra::Base
    get '/articles/:id/comments' do
      # Find the article by its ID
      article = Article.find(params[:id])
  
      # Retrieve all comments for the article from the database
      comments = article.comments
  
      # Render the comment list using an ERB template
      erb :comment_list,
  