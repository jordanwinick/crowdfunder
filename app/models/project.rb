class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges

  belongs_to :user

  scope :expired, -> { where("end_date < ?", Time.now) }
  scope :active, -> { where("end_date >= ?", Time.now) }

  accepts_nested_attributes_for :rewards, :reject_if => :all_blank, :allow_destroy => true

  def expired?
    end_date < Time.now
  end

  def active?
    end_date >= Time.now
  end

  # def time_left
  #   from_time = Time.now
  #   time_ago_in_words(from_time, end_date)
  # end
# link_to_if project.active?, project.name, project_path(project)

end
