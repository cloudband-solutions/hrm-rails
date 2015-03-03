class AddDeductionGraphIdToDeductions < ActiveRecord::Migration
  def change
    add_column :deductions, :deduction_graph_id, :integer
  end
end
