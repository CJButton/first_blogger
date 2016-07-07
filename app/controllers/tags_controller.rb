




class TagsController < ApplicationController
    # Got it! Now we need to add a template for the page to use!
    
    def index
        @tag = Tag.all
    end
    # let's add an index action here; similar to the one for articles
    def show
        @tag = Tag.find(params[:id])
    end
    
    before_filter :require_login, only: [:destroy]
    
    def destroy
        @tag = Tag.find(params[:id])
        @tag.delete
        
        flash.notice = "Tag '#{@tag.name}' Destroyed!"
        
        redirect_to tags_path
    end
end
