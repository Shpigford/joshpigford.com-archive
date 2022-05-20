class ArtsController < ApplicationController
  def index
    @art = Art.all.order(Arel.sql('RANDOM()'))
    @title = 'Art'
    #@description = "My art."
    @categories = ArtCategory.all.order(:name)
  end

  def show
    @art = Art.find(params[:id])
    @title = "#{@art.name} - #{@art.art_category.name} - Art"
  end

  def series
    @series = ArtCategory.where(slug: params[:series]).first
    @art = @series.arts.order(Arel.sql('RANDOM()'))

    @title = "#{@series.name} - Art"
    #@description = "My art."
  end
  
end
