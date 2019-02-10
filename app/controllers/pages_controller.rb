class PagesController < ApplicationController
  def index
    
  end

  def health
    @title = 'Health'
  end

  def interviews
    @title = 'Interviews'
  end

  def music
    @title = 'Music'
  end

  def now
    @title = 'Now'
  end

  def past
    @title = 'Past'
  end

  def podcasts
    @title = 'Podcasts'
  end
end
