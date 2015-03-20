class ReportsController < ApplicationController
  before_action  :set_report, only: [:show, :edit, :update, :destroy, :download, :check_ownership]
before_filter :check_ownership, only: [:show, :edit, :update, :destroy, :download]
before_filter :check_admin, only: [:create, :edit, :update, :destroy, :download]
  respond_to :html


  def index
    @user = current_user
    @customer = current_user.customer
       if @user.is_admin
      	  @reports = Report.all
       else
  	   @reports = @user.customer.reports    
       respond_with(@reports)
       end
  end     

  def show
    respond_with(@report)
  end

  def new
    @report = Report.new
    
    respond_with(@report)
    
  end

  def edit
    
  end

  def create

    @report = Report.new(report_params)
    
    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: 'Report was successfully created.' }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
    
    
  end

  def update
    
    @report.update(report_params)
   
    respond_with(@report)
    
  end

  def destroy
    @report.destroy
    respond_with(@report)
  end
  
     	def download
     	
     	
    	send_file File.join("public", "pdf_reports", @report.customer_id.to_s, @report.filename), :type=> "application/pdf", :x_sendfile=>true
	    end

        def check_ownership
          
          if current_user.customer_id != @report.customer_id && !current_user.is_admin #check if current user is a user tied to report's owner
         
          redirect_to reports_path,
          alert: "You are not authorized to load this report." # boot them to the main page if not admin
          end
        end
  
     

  private

    def set_report
      @report = Report.find(params[:id])
    end
    
 

    def report_params
      params.require(:report).permit(:reportname, :description, :filename, :customer_id, :report_date, :pdf)
    end

   
end