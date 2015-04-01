class ReportsController < InternalController
  before_action  :set_report, only: [:show, :edit, :update, :destroy, :download, :check_ownership]
before_filter :check_ownership, only: [:show, :edit, :update, :destroy, :download]
before_filter :check_admin, only: [:create, :edit, :update, :destroy, :download]
  respond_to :html


def index
    @user = current_user
    @customer = current_user.customer
    if !current_user.is_admin

     cust_reports = current_user.customer.reports
       
     @reports_grid = initialize_grid(cust_reports,
      :include => [:customer, :building],
      :conditions => {:customer => @customer},
      :per_page => 10
      )
    else
    @reports_grid = initialize_grid(Report,
      :include => [:customer, :building],
      :per_page => 10
      )
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
  @building =  @report.building
 @customer = @report.customer
  

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
    @report = Report.find(params[:id])
    @report.customer_id = @report.building.customer_id
    @report.update(report_params)
    respond_with(@report)
end

def destroy
    @report.destroy
    respond_with(@report)
end
  
def download
  if ENV['MY_ENV'] != 'production'
    data = open(@report.pdf.to_s) 
    send_data data.read, filename: @report.filename, type: "application/pdf", disposition: 'inline', stream: 'true', buffer_size: '4096' 
  else
    send_file File.join("public", "pdf_reports", @report.customer_id.to_s, @report.filename), :type=> "application/pdf", :x_sendfile=>true
  end
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
      params.require(:report).permit(:reportname, :description, :filename, :customer_id, :report_date, :pdf, :building_id)
    end
end