class CreateDeductionGraphEntries < ActiveRecord::Migration
  def change
    create_table :deduction_graph_entries do |t|
      t.integer :deduction_graph_id
      t.decimal :min_compensation
      t.decimal :max_compensation
      t.decimal :salary_base
      t.decimal :employee_contribution
      t.decimal :employer_contribution

      t.timestamps null: false
    end
  end
end
