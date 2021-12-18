class ToysController < ApplicationController
  def index
    @toys = Toy.all.order(:platform, :name)
    @title = 'Designer Toys'
    @description = "My designer toy collection."
  end

  def show
    @toy = Toy.find(params[:id])
    @title = "#{@toy.name} - #{@toy.platform} - Designer Toys"
  end
end
