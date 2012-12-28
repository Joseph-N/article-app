class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def index
    @category = Category.all
  end
  
  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:success] = "Category Added!"
      redirect_to categories_path
    else
      render 'new'
    end
  end
  
end
