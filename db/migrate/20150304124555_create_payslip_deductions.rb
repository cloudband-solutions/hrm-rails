class CreatePayslipDeductions < ActiveRecord::Migration
  def change
    create_table :payslip_deductions do |t|
      t.decimal :amount
      t.integer :payslip_id
      t.integer :deduction_id

      t.timestamps null: false
    end
  end
end
