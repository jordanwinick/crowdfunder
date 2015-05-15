class ProjectsController < ApplicationController

  def index
    @projects = if params[:search]
      Project.where("LOWER(name) LIKE LOWER(?)", "%#{params[:search]}%")
    else
      Project.all
    end

    @projects = @projects.order('projects.end_date').page(params[:page])
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

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_url
  end

  private
  def project_params
    params.require(:project).permit(:name, :description, :goal, :start_date, :end_date, :rewards_attributes => [:id, :title, :description, :amount, :backer_limit, :_destroy])
  end


end
