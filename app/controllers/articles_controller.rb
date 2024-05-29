class ArticlesController < ApplicationController
  def index
    @articles=Article.all
    @article = Article.new  # Ensure @article is initialized
  end
  def show
    @article = Article.find(params[:id])
  end
  
  def new
    @article = Article.new#The new action instantiates a new article, but does not save it. 
  end
  
def create
    @article = Article.new(title: "...", body: "...")

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

#   The edit action fetches the article from the database, and stores it in @article so that it can be used when building the form. By default, the edit action will render app/views/articles/edit.html.erb.

# The update action (re-)fetches the article from the database, and attempts to update it with the submitted form data filtered by article_params. If no validations fail and the update is successful, the action redirects the browser to the article's page. Else, the action redisplays the form — with error messages — by rendering app/views/articles/edit.html.erb.
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  # The destroy action fetches the article from the database, and calls destroy on it. Then, it redirects the browser to the root path with status code 303

private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
 