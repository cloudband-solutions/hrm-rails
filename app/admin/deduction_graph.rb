ActiveAdmin.register DeductionGraph do
  menu parent: "Deduction Management"
  controller do
    def permitted_params
      params.permit!
    end
  end

  filter :name

  form do |f|
    f.inputs "Deduction Graph Details" do
      f.input :name
      f.has_many :deduction_graph_entries, heading: 'Deduction Graph Entries', allow_destroy: true do |ff|
        ff.input :min_compensation
        ff.input :max_compensation
        ff.input :salary_base
        ff.input :employee_compensation_contribution
        ff.input :employee_contribution
        ff.input :employer_contribution
      end
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
    end
    panel "Entries" do
      table_for deduction_graph.deduction_graph_entries, sortable: true do
        column :min_compensation do |dge|
          number_to_currency(dge.min_compensation, unit: "P")
        end
        column :max_compensation do |dge|
          number_to_currency(dge.max_compensation, unit: "P")
        end
        column :salary_base do |dge|
          number_to_currency(dge.salary_base, unit: "P")
        end
        column :ec do |dge|
          number_to_currency(dge.employee_compensation_contribution, unit: "P")
        end
        column :employer_contribution do  |dge|
          number_to_currency(dge.employer_contribution, unit: "P")
        end
        column :employee_contribution do  |dge|
          number_to_currency(dge.employee_contribution, unit: "P")
        end
      end
    end
  end
end
