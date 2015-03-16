class ReportsController < ApplicationController
  before_action :check_admin, :set_report, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @reports = Report.all
    respond_with(@reports)
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
    @report.save
    respond_with(@report)
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
     	@report = Report.find(params[:id])
     	
    	send_file File.join("public", "pdf_reports", @report.customer_id.to_s, @report.filename), :type=> "application/pdf", :x_sendfile=>true
	end

  private
    def set_report
      @report = Report.find(params[:id])
    end
    
 

    def report_params
      params.require(:report).permit(:reportname, :description, :filename, :customer_id, :report_date)
    end
end