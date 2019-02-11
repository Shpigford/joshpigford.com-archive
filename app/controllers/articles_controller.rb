class ArticlesController < ApplicationController
  def index
    @articles = Article.order('publish_at desc')
    @title = "Articles"
    @description = "A collection of fine writing by Josh Pigford"
  end

  def show
    @article = Article.find_by(slug: params[:id])
    @title = @article.title
  end
end
