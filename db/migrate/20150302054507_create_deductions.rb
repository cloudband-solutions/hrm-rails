class CreateDeductions < ActiveRecord::Migration
  def change
    create_table :deductions do |t|
      t.string :name
      t.string :code
      t.decimal :amount
      t.boolean :is_percent

      t.timestamps null: false
    end
  end
end
