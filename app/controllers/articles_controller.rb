class ArticlesController < ApplicationController
  def index
    @articles = Article.order('publish_at desc')

    respond_to do |format|
      format.html
      format.rss { render :layout => false }
    end
  end

  def show
    @article = Article.find_by(slug: params[:id])
  end
end