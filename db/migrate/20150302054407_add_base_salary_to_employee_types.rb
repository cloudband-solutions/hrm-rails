class AddBaseSalaryToEmployeeTypes < ActiveRecord::Migration
  def change
    add_column :employee_types, :base_salary, :decimal
  end
end
