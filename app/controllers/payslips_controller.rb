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

  def edit
    @payslip = Payslip.find(params[:id])
    @employee = @payslip.employee
  end

  def create
    @payslip = Payslip.new(payslip_params)

    if @payslip.save
      flash[:success] = "Successfully created payslip"
      redirect_to payslip_path(@payslip)
    else
      flash[:error] = "Invalid"
      render :new
    end
  end

  def update
    @payslip = Payslip.find(params[:id])

    if @payslip.update(payslip_params)
      flash[:success] = "Successfully updated payslip"
      redirect_to payslip_path(@payslip)
    else
      flash[:error] = "Invalid"
      render :edit
    end
  end

  def show
    @payslip = Payslip.find(params[:id])
  end

  def payslip_params
    params.require(:payslip).permit!
  end
end
