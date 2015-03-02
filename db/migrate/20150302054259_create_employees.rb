class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :home_number
      t.string :mobile_number
      t.string :email
      t.string :sss_number
      t.string :tin_number
      t.string :identification_number
      t.date :date_of_birth

      t.timestamps null: false
    end
  end
end
