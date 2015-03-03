class AddNetSalaryToEmployeeTypes < ActiveRecord::Migration
  def change
    add_column :employee_types, :net_salary, :decimal
  end
end
