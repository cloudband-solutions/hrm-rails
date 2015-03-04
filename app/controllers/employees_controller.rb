class EmployeesController < ApplicationController

  def index
    @employees = Employee.select("*")

    if params[:q].present?
      @q = params[:q]

      @q.split(' ').each do |q|
        @employees = @employees.where("first_name LIKE :q OR middle_name LIKE :q OR last_name LIKE :q OR identification_number LIKE :q", q: "%#{@q}%")
      end
    end

    if params[:employee_type].present?
      @employee_type = EmployeeType.find(params[:employee_type])

      @employees = @employees.where(employee_type_id: @employee_type.id)
    end

    @employees = @employees.page(params[:page]).per(20)
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to employee_path(@employee)
    else
      render "new"
    end
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])

    if @employee.update_attributes(employee_params)
      redirect_to employee_path(@employee)
    else
      render "edit"
    end
  end

  def destroy 
    @employee = Employee.find(params[:id])
    @employee.destroy

    redirect_to employees_path
  end

  def employee_params 
    params.require(:employee).permit!
  end

end
