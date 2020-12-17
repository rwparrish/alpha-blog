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
    #Below I am rendering the params to the browser so I can see what I am working with - 'article' is the key for the entire params
    render plain: params[:article]
  end

end