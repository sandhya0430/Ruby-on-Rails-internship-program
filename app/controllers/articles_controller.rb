class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end
  
  def index
    @articles=Article.all
  end
  def show
    @article = Article.find(params[:id])
  end
 

  def create
    @article = Article.new(title: "...", body: "...")

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end
  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
 