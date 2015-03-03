class EmployeeTypeDeduction < ActiveRecord::Base
  belongs_to :employee_type
  belongs_to :deduction
end
