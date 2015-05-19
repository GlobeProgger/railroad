class ArticlesController < ApplicationController

	  def index
	    @articles = Article.all
	  end

	  def show
	    @article = Article.find(params[:id])
	  end

	def new
	end

	def destroy
	  @article= Article.find(params[:id])
	  if @article.destroy
		flash[:notice] = "Successfully deleted message."
   		 redirect_to articles_path

	  else
     		flash[:notice] = "NOT Successfully deleted message."
 	   redirect_to articles_path

	  end
	end

	def create
	  @article = Article.new(article_params)
	 
	  @article.save
	  redirect_to @article
	end
 
	private
	  def article_params
	    params.require(:article).permit(:title, :text, :author)
	  end

end
