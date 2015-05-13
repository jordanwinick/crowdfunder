class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
    @reward = Reward.new
  end

  def create
    @project = current_user.owned_projects.build(project_params)
    if @project.save
      redirect_to projects_url
    else
      render 'new'
    end
  end
  
  private
  def project_params
    params.require(:project).permit(:name, :description, :goal, :start_date, :end_date, :rewards_attributes => [:id, :title, :description, :amount, :backer_limit, :_destroy])
  end


end
