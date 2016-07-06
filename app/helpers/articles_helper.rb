


module ArticlesHelper
    
    # permit allows us to help control the attributes we want to accept
    def article_params
        params.require(:article).permit(:title, :body, :tag_list)
    end
end
