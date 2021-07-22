class ArticlesController < ApplicationController
  before_action :set_find_article, only: %i[show edit update destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params_article)
    @article.save
    redirect_to article_path(@article.id)
  end

  def edit; end

  def update
    @article.update(params_article)
    redirect_to article_path(@article.id)
  end

  def show; end

  def destroy
    @article.destroy
    redirect_to articles_path(@articles)
  end

  private

  def params_article
    params.require(:article).permit(:title, :content)
  end

  def set_find_article
    @article = Article.find(params[:id])
  end
end
