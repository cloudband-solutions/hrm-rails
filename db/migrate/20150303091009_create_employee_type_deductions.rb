class CreateEmployeeTypeDeductions < ActiveRecord::Migration
  def change
    create_table :employee_type_deductions, id: false do |t|
      t.references :employee_type
      t.references :deduction
    end

    add_index :employee_type_deductions, [:employee_type_id, :deduction_id], unique: true, name: 'employee_type_deduction_index'
  end
end
