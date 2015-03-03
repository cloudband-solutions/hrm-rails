class DeductionGraphEntry < ActiveRecord::Base
  belongs_to :deduction_graph

  validates :min_compensation, presence: true, numericality: true
  validates :max_compensation, presence: true, numericality: true
  validates :employee_compensation_contribution, presence: true, numericality: true

  validate :min_less_than_max
  def min_less_than_max
    if self.min_compensation >= self.max_compensation
      errors.add(:min_compensation, "can't be greater than or equal to max")
    end
  end

  validates :salary_base, presence: true, numericality: true
  validates :employee_contribution, presence: true, numericality: true
  validates :employer_contribution, presence: true, numericality: true
end
