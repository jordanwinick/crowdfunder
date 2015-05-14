class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges

  belongs_to :user

  scope :expired, -> { where("end_date < ?", Time.now) }
  scope :active, -> { where("end_date >= ?", Time.now) }

  accepts_nested_attributes_for :rewards, :reject_if => :all_blank, :allow_destroy => true

  validates :title, :description, :amount, :backer_limit, :presence => true

  def expired?
    end_date < Time.now
  end

  def active?
    end_date >= Time.now
  end

  def amount_pledged
    total_pledges = pledges.where(project_id: id)
    if total_pledges
      total_pledges.sum(:amount)
    else
      0
    end
  end

  def deletable?
    amount_pledged == 0
  end
# link_to_if project.active?, project.name, project_path(project)

end
