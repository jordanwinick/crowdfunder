class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.owned_projects.build(project_params)
    if @project.save
      redirect_to projects_url
    else
      render 'new'
    end
  end
  
end
