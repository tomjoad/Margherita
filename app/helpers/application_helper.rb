module ApplicationHelper
  def full_title(page_title)
    title = 'Margherita'
    if page_title.empty?
      title
    else
      "#{Margherita} | #{page_title}"
    end
  end

  def display_user_role
    if current_user
      current_user.role
    else
      "guest"
    end
  end
end
