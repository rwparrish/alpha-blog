class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    # byebug - built in Ruby debugger used to freeze the program so data can be expossed where it is placed
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
      flash[:notice] = "This article was saved successfully"
      redirect_to @article
    else 
      render 'new'
    end
  end

end