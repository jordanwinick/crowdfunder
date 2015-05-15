class PledgesController < ApplicationController
	before_filter :load_reward

  def create
  	@project = Project.find(@reward.project_id)
    @pledge = @reward.pledges.build(pledge_params)
    @pledge.user = current_user
    if @pledge.save
      redirect_to project_path(@project), notice: "Pledge successful!"
    else
      render 'projects/show'
    end
  end

  private
  def pledge_params
    params.permit(:reward_id)
  end

  def load_reward
    @reward = Reward.find(params[:reward_id])
  end

end
