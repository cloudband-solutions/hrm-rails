class PayslipsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @payslips = Payslip.select("*")
  end

  def new_ps
    @year = params[:payslip][:year]
    @month = params[:payslip][:month]
    @employee = params[:payslip][:employee]

    redirect_to new_payslip_path(year: @year, month: @month, employee: @employee)
  end

  def new
    @employee = Employee.find(params[:employee])
    @payslip = PayslipService.build_payslip(@employee)
  end

  def payslip_params
    params.require(:payslip).permit!
  end
end
