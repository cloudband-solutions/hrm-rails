class Payslip < ActiveRecord::Base

  STATUSES = ["pending", "approved"]

  validates :reference_number, presence: true, uniqueness: true
  validates :status, presence: true, inclusion: { in: STATUSES }

  belongs_to :employee
  validates :employee, presence: true

  belongs_to :employee_type
  validates :employee_type, presence: true

  validates :gross_amount, presence: true, numericality: true
  validates :net_amount, presence: true, numericality: true

  validates :particular, presence: true
  validates :paid_at, presence: true

  before_validation :load_defaults

  has_many :payslip_deductions
  accepts_nested_attributes_for :payslip_deductions

  def panel_status
    if self.status == "pending"
      return "danger"
    elsif self.status == "approved"
      return "success"
    else
      return "default"
    end
  end

  def load_defaults
    if self.new_record?
      self.status = "pending"
    end

    deduction = 0.00
    self.payslip_deductions.each do |payslip_deduction|
      deduction += payslip_deduction.amount
    end

    self.net_amount = self.gross_amount - deduction

    self.reference_number = next_reference_number
  end

  def to_s
    reference_number
  end

  def next_reference_number
    if Payslip.all.count > 0
      return Payslip.last.id.to_s.rjust(10, "0")
    else
      return 1.to_s.rjust(10, "0")
    end
  end
end
