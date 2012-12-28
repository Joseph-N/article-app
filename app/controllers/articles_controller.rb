class ArticlesController < ApplicationController
  def index
    @article = Article.search(params[:search])
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(params[:article])
    if @article.save
      flash[:success] = "Article added successfully!"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end
  
  def show
    @article = Article.find(params[:id])
    #if users using older slug(url) redirect them to the new url
    if request.path != article_path(@article)
      redirect_to article_path(@article)
    end
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      flash[:success] = "Update successfull!"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end
end
