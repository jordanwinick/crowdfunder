class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @rewards = @project.rewards
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

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      redirect_to project_path(@project)
    else
      render 'edit'
    end
  end
  
  private
  def project_params
    params.require(:project).permit(:name, :description, :goal, :start_date, :end_date, :rewards_attributes => [:id, :title, :description, :amount, :backer_limit, :_destroy])
  end


end
