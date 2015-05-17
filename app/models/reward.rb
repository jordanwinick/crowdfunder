class Reward < ActiveRecord::Base
  belongs_to :project
  has_many :pledges

  def num_of_pledges
    pledges = Pledge.where(reward_id: id)
    if pledges
      pledges.count
    else
      0
    end
  end

  def avail_pledges?
    num_of_pledges < backer_limit
  end

end
