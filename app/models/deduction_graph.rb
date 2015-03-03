class DeductionGraph < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :deduction_graph_entries
  accepts_nested_attributes_for :deduction_graph_entries

  def to_s
    name
  end
end
