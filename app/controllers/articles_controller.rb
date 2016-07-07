class ArticlesController < ApplicationController
    
    include ArticlesHelper
    
    # The index page is what the app will send back when a user requests localhost:3000/articles/
    # it should be a list of articles
    def index
        @articles = Article.all
    end
    
    before_filter :require_login, except: [:show, :index]
    
    def show
        # should I keep the "params hash" (which is actually a method which returns a hash)?
        @article = Article.find(params[:id])
        @comment = Comment.new
        @comment.article_id = @article.id
    
    end
    
    def new
        @article = Article.new
    end
    
    def create
        @article = Article.new(article_params)
        @article.save
        
        flash.notice = "Article '#{@article.title}' Created!"
        
        redirect_to article_path(@article)
    end
    
    def destroy
        @article = Article.find(params[:id]).delete
        @articles = Article.all
        # BE SUPER CAREFUL ABOUT
        # article_path AND articles_path
        # NOTICE THE 'S'
        flash.notice = "Article '#{@article.title}' Article Deleted!"
        redirect_to articles_path(@articles)
    end
    
    def edit
        @article = Article.find(params[:id])
    end
    
    def update
        @article = Article.find(params[:id])
        @article.update(article_params)
        # the update method is new here
        # update automatically saves the changes
        # NOTICE we are using the article_params method as before
        # so we only update the attributes we're allowed to
        
        flash.notice = "Article '#{@article.title}' Updated!"
        
        redirect_to article_path(@article)
    end
end

