ActiveAdmin.register EmployeeType do
  menu parent: "Employee Management"
  controller do
    def permitted_params
      params.permit!
    end
  end

  index do
    column :name
    column :code
    column :number_of_employees do |employee_type|
      employee_type.employees.count
    end
    column :base_salary do |employee_type|
      number_to_currency(employee_type.base_salary, unit: "P")
    end
    column :net_salary do |employee_type|
      number_to_currency(employee_type.net_salary, unit: "P")
    end
    actions
  end

  filter :name
  filter :code

  form do |f|
    f.inputs "Employee Type Details" do
      f.input :name
      f.input :code
      f.input :base_salary
      f.input :deductions, as: :check_boxes
      f.input :description
    end

    f.actions
  end
end
