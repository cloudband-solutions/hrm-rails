class EmployeeType < ActiveRecord::Base
   validates :name, presence: true
   validates :code, presence: true, uniqueness: true
   validates :description, presence: true
   validates :base_salary, presence: true, numericality: true

   has_many :employees
end
