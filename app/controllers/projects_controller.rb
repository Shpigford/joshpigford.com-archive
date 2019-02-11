class ProjectsController < ApplicationController
  def index
    @projects = Project.order('year ASC, id ASC')
  end

  def show
    @project = Project.find_by(slug: params[:id])
    @title = @project.name
    @description = "#{@project.name}: #{@project.description}"
  end
end
