class ToysController < ApplicationController
  def index
    @toys = Toy.all
    @title = 'Designer Toys'
    @description = "My designer toy collection."
  end

  def show
    @toy = Toy.find(params[:id])
    @title = "#{@toy.name} - Designer Toys"
  end
end
