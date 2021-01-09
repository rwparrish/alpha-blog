class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    # byebug - built in Ruby debugger used to freeze the program so data can be expossed where it is placed
    # @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end
  
  def edit
  end

  def create
    @article = Article.new(article_params)
    # hard coding a user to a newly created article to avoid error message until user authentication is working
    # this will work as long as there are valid users in the dev databe 'users' table
    @article.user = User.first
    if @article.save
      flash[:notice] = "This article was saved successfully"
      redirect_to @article
    else 
      render 'new'
    end
  end

  def update 
    if @article.update(article_params)
      flash[:notice] = "This article was updated successfully"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

end