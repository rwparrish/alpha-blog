class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    # byebug - built in Ruby debugger used to freeze the program so data can be expossed where it is placed
    @article = Article.find(params[:id])
  end

  def new
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    @article.save
    # redirect_to article_path(@article) - the code below is a shortcut for this
    redirect_to @article 
  end

end