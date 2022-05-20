class ArtsController < ApplicationController
  def index
    @art = Art.all.order(Arel.sql('RANDOM()'))
    @categories = ArtCategory.all.order(:name)
  end

  def show
    @art = Art.find(params[:id])
  end

  def series
    @series = ArtCategory.where(slug: params[:series]).first
    @art = @series.arts.order(Arel.sql('RANDOM()'))
  end
  
end
