class Deduction < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :code, presence: true, uniqueness: true
  validates :amount, presence: true, numericality: true

  has_many :employee_type_deductions
  has_many :employee_types, through: :employee_type_deductions

  belongs_to :deduction_graph

  before_validation :load_defaults

  def load_defaults
  end
end
