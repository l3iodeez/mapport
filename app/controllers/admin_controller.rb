class AdminController < RestrictedController
    respond_to :html



    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :approved, :customer_id, :is_admin, :pass_changed)
    end
  
  def index
    if params[:approved] == "false"
       @users = User.where("approved = false")
	else
      @users = User.all
    end
  end

    def show
      @user = User.find_by_id(params[:id])
    respond_with(@user)
  end

  def new
    @user = User.new
    respond_with(@user)
  end
  def create
    @user = User.new(user_params)
    @user.save
    redirect_to admin_index_path
  end
    
  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
     @user = User.find_by_id(params[:id])
      @user.update_attributes(user_params)
  
  redirect_to admin_index_path
  end  
def destroy

  @user = User.find_by_id(params[:id])
  if @user.email != current_user.email
    @user.destroy
    redirect_to admin_index_path, alert: '' + @user.email + ' has been sucessfully removed'
    else
     redirect_to admin_index_path, alert: 'You cannot delete yourself. ' + @user.email + ' To delete this account, log in as another admin and try again.'
  end
  
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
