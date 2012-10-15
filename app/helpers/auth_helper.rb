module AuthHelper
   def user_should_be_admin
    unless current_user.role.admin?
      redirect_to root_url, notice: "No permission."
    end
  end

end
