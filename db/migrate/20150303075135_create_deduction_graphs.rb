class CreateDeductionGraphs < ActiveRecord::Migration
  def change
    create_table :deduction_graphs do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
