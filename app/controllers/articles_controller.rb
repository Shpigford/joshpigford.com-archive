class ArticlesController < ApplicationController
  def index
    @articles = Article.order('publish_at desc')
    @title = "Articles"
  end

  def show
    @article = Article.find_by(slug: params[:id])
    @title = @article.title
  end
end
