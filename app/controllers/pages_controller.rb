class PagesController < ApplicationController
  def gear
    @title = "Gear"
  end

  def index
  end

  def interviews
    @title = "Interviews"
  end

  def music
    @title = "Music"
  end

  def now
    @title = "Now"
  end

  def podcasts
    @title = "Podcasts"
  end

  def reading
    @title = "Reading"
  end

  def investments
    @title = "Investments"
  end
end
