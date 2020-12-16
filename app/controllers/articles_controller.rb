class ArticlesController < ApplicationController

  def show
    # byebug - built in Ruby debugger used to freeze the program so data can be expossed where it is placed
    @article = Article.find(params[:id])
  end

end