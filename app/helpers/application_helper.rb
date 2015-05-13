module ApplicationHelper

  def project_owner?(project)
    if current_user
      current_user.id == project.user_id
    end
  end

  def format_date(date)
    date.strftime("%b %d, %Y")
  end

  def time_in_days(end_date)
    from_time = Time.now
    distance_of_time_in_words(from_time, end_date) 
  end

end
