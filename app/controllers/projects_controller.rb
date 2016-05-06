class ProjectsController < ApplicationController

  def index
    @projects = Project.published
  end

  def show
    @project = Project.find_by_slug(params[:slug])
  end

end
