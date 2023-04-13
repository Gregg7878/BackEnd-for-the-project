

class ArticleDetail < Sinatra::Base
    get '/articles/:id' do
      # Find the article by its ID
      article = Article.find(params[:id])
  
      # Render the article details using an ERB template
      erb :article_detail, locals: { article: article }
    end
  end
  