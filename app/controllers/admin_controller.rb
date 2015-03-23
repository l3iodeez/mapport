class AdminController < ApplicationController
  before_action :check_admin
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :approved)
    end
  
  def index
    if params[:approved] == "false"
       @users = User.where("approved = false")
	else
      @users = User.all
    end
  end
    
  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    @user.update_attributes(params[:id])
  end  

  
  def approve_user
  	  @user = User.find(params[:id])
  unless  @user.is_admin  
	  
	  @user.approved = !@user.approved
	  if @user.save
	  	if @user.approved
	  		flash[:notice] = "#{@user.email} approved"
    		else
    			flash[:notice] = "#{@user.email} de-approved"
    		end
	  else
	    flash[:alert] = "#{@user.email} approval failure"
	  end
        redirect_to :back
  else
	flash[:alert] = "This is an admin."
	redirect_to :back	
  end
  end
 


end
