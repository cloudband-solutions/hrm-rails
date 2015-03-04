class PayslipDeduction < ActiveRecord::Base
  validates :amount, presence: true, numericality: true

  belongs_to :payslip
  belongs_to :deduction
end
