

class CommentForm < Sinatra::Base
    post '/comments' do
      # Create a new comment with the submitted form data
      comment = Comment.create(params[:comment])
  
      # Redirect back to the article detail page for the commented article
      redirect "/articles/#{comment.article_id}"
    end
  end
  