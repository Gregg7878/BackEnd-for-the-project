
class ArticleList < Sinatra::Base
    get '/articles' do
      # Retrieve all articles from the database
      articles = Article.all
  
      # Render the article list using an ERB template
      erb :article_list, locals: { articles: articles }
    end
  end
  