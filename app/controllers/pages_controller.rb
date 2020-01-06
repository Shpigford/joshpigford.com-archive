class PagesController < ApplicationController
  def index
    @description = "The home of profesional webmaster Dr. Josh Pigford. Just kidding, I'm not a doctor. Or a webmaster. I just make things."
  end

  def health
    @title = 'Health'
    @description = "In 2019 I'm laser focused on living a healthier and more sustainable lifestyle. I've always struggled with getting regular exercise as well as having a healthy weight."
  end

  def interviews
    @title = 'Interviews'
    @description = "The interviews I've done over the years."
  end

  def music
    @title = 'Music'
    @description = "I'm an obsessive music listener and have been my whole life. I won't say I'm a music snob, but let's be honest, 95% of popular music these days is categerically some of the worst music ever created, but I digress 👴."
  end

  def music_2018
    @title = "Top Albums of 2018" 
    @description = "These were the albums I had on rotation the most. In hindsight looks like I had pretty polarizing listening habits, going back and forth between pop and hardcore."
  end

  def music_2019
    @title = "Top Albums of 2019" 
    @description = "These were the albums, released in 2019, that I had on rotation the most."
  end

  def now
    @title = 'Now'
    @description = "What I'm working on now"
  end

  def podcasts
    @title = 'Podcasts'
    @description = "Here are podcasts I recommend checking out. Some publish regularly, others are short, one-off series."
  end

  def reading
    @title = 'Reading'
    @description = "What I'm reading and what I've recently read."
  end

  def learning
    @title = 'Learning'
    @description = "Resources for learning various things"
  end

  def gear
    @title = 'Gear'
    @description = "The hardware and software I use to make all the things!"
  end
end
