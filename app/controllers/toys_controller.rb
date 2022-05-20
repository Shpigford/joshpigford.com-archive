class ToysController < ApplicationController
  def index
    @toys = Toy.all.order(:platform, :name)
  end

  def show
    @toy = Toy.find(params[:id])
  end
end
