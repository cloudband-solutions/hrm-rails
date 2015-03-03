ActiveAdmin.register Deduction do
  menu parent: "Deduction Management"
  controller do
    def permitted_params
      params.permit!
    end
  end

  index do
    column :name
    column :code
    column :amount do |o|
      if o.is_percent == true
        "#{o.amount.round(2) * 100}%"
      else
        number_to_currency(o.amount, unit: "P")
      end
    end
    column :is_percent
    column :deduction_graph
    actions
  end

  filter :name
  filter :code

  form do |f|
    f.inputs "Deduction Details" do
      f.input :name
      f.input :code
      f.input :amount
      f.input :is_percent
      f.input :deduction_graph
    end

    f.actions
  end
end
