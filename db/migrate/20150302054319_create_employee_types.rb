class CreateEmployeeTypes < ActiveRecord::Migration
  def change
    create_table :employee_types do |t|
      t.string :name
      t.string :code
      t.text :description

      t.timestamps null: false
    end
  end
end
