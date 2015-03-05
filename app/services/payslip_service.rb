class PayslipService
  def self.build_payslip(employee)
    employee_type = employee.employee_type

    gross_amount = employee_type.base_salary / 2

    payslip_deductions = []
    employee_type.deductions.each do |deduction|
      d_amount = 0.00
      if deduction.is_percent == true
        d_amount = deduction.amount * employee_type.base_salary
      elsif !deduction.deduction_graph.nil?
        deduction_graph_entry = deduction.deduction_graph.deduction_graph_entries.where("min_compensation <= ? AND max_compensation >= ?", employee_type.base_salary, employee_type.base_salary).first
        d_amount = deduction_graph_entry.employee_contribution
      else
        d_amount = deduction.amount
      end

      d_amount = (d_amount / 2).round(2)
      payslip_deductions << PayslipDeduction.new(amount: d_amount, deduction: deduction)
    end

    # TODO: Compute for date
    paid_at = Time.now

    payslip = Payslip.new(employee: employee, gross_amount: gross_amount, payslip_deductions: payslip_deductions, employee_type: employee_type, paid_at: paid_at)
  end
end
