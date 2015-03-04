class CreatePayslips < ActiveRecord::Migration
  def change
    create_table :payslips do |t|
      t.decimal :gross_amount
      t.decimal :net_amount
      t.date :paid_at
      t.integer :employee_id
      t.string :status
      t.string :reference_number
      t.integer :employee_type_id
      t.text :notes
      t.text :particular

      t.timestamps null: false
    end
  end
end
