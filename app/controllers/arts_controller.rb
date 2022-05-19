class ArtsController < ApplicationController
  def index
    @art = Art.all.order(:name)
    @title = 'Art'
    @description = "My art."
    @categories = ArtCategory.all.order(:name)
  end

  def show
    @art = Art.find(params[:id])
    @title = "#{@art.name} - #{@art.art_category.name} - Art"
  end

  def series
    @series = ArtCategory.where(slug: params[:series]).first

    @art = @series.arts.order(:name)

    @title = 'Art'
    @description = "My art."

  end
  
end
