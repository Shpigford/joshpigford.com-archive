class ProjectsController < ApplicationController
  def index
    @projects = Project.order('year ASC, id ASC')
    @title = "Projects"
    @description = "I've worked on an absurd number of things in the past. This is a database of all #{@projects.count} of those things!"
  end

  def show
    @project = Project.find_by(slug: params[:id])
    @title = @project.name
    @description = "#{@project.name}: #{@project.description}"
  end
end
