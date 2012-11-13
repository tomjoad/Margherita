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

  def user_should_be_admin
    unless current_user.role.admin?
      redirect_to root_url, notice: "No permission."
    end
  end

  def user_is_admin_or_seller?
    current_user.role.seller? || current_user.role.admin?
  end

  def current_view_is?(controller, action)
    ( params[:controller] == controller && params[:action] == action )
  end
end
