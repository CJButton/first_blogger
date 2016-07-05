class ArticlesController < ApplicationController
    # The index page is what the app will send back when a user requests localhost:3000/articles/
    # it should be a list of articles
    def index
        @articles = Article.all
    end
    
    def show
        # should I keep the "params hash" (which is actually a method which returns a hash)?
        @article = Article.find(params[:id])
    
    end
end

