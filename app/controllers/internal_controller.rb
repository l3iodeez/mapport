class InternalController < ApplicationController
	before_action :check_changed_pass

	  def check_changed_pass
  @user = current_user
    unless@user.pass_changed #make sure user has changed their password before accessing internal pages
      redirect_to edit_user_registration_path,
      alert: "You must change your password before logging in for the first time"
    end
  end
end