class PledgesController < ApplicationController
	before_filter :load_reward

  def create
  	@project = Project.find(@reward.project_id)
    @pledge = @reward.pledges.build
    @pledge.user = current_user
    @pledge.amount = @reward.amount
    @pledge.project_id = @project.id
    if @pledge.save
      redirect_to project_path(@project), notice: "Pledge successful!"
    else
      render 'projects/show'
    end

    # respond_to do |format|
    #   format.html do
    #     if request.xhr?
    #       render 'owner_info'
    #     end
    #   end
    # end

  end

  private

  def load_reward
    @reward = Reward.find(params[:reward_id])
  end

end
