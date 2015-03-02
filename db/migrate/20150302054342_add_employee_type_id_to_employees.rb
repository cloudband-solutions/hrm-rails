class AddEmployeeTypeIdToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :employee_type_id, :integer
  end
end
