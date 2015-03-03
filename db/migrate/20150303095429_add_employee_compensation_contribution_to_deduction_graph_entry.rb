class AddEmployeeCompensationContributionToDeductionGraphEntry < ActiveRecord::Migration
  def change
    add_column :deduction_graph_entries, :employee_compensation_contribution, :decimal
  end
end
