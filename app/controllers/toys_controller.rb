class ToysController < ApplicationController
  def index
    @toys = Toy.all
    @title = 'Toys'
    @description = "My designer toy collection."
  end

  def show
    @toy = Toy.find(params[:id])
  end
end
