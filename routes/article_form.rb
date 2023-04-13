# routes/article_form.rb

class ArticleForm < Sinatra::Base
    get '/articles/new' do
      require_authentication
  
      # Render the article form using an ERB template
      erb :article_form
    end
  
    post '/articles' do
      require_authentication
  
      # Create a new article with the submitted form data
      article = current_user.articles.create(params[:article])
  
      # Redirect to the article detail page for the newly created article
      redirect "/articles/#{article.id}"
    end
  end
  