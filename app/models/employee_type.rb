class EmployeeType < ActiveRecord::Base
  has_many :employees
  has_many :employee_type_deductions
  has_many :deductions, through: :employee_type_deductions

  validates :net_salary, presence: true

  before_validation :load_defaults

  def load_defaults
    self.net_salary = self.base_salary

    d_amount = 0.00
    self.deductions.each do |deduction|

      if deduction.is_percent == true
        d_amount += deduction.amount * self.base_salary
      elsif !deduction.deduction_graph.nil?
        deduction_graph_entry = deduction.deduction_graph.deduction_graph_entries.where("min_compensation <= ? AND max_compensation >= ?", self.base_salary, self.base_salary).first
        d_amount += deduction_graph_entry.employee_contribution
      else
        d_amount += deduction.amount
      end
    end

    self.net_salary = self.net_salary - d_amount
  end
end
