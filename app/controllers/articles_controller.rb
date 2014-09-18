class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      flash[:success] = "Article created!"
      redirect_to article_path(@article)
    else
      flash[:error] = "Please fix errors below."
      render :new
    end
  end

  def edit; end

  def update
    @article.update(article_params)

    if @article.save
      flash[:success] = "Article updated!"
      redirect_to article_path(@article)
    else
      flash[:error] = "Please fix errors below."
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :author, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
