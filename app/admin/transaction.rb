ActiveAdmin.register Transaction do
  permit_params :deposit, :gateway, :direction, :amount, :comment

  index do
    selectable_column
    id_column
    column :deposit { |deposit| link_to deposit.id, admin_deposit_path(deposit) }
    column :gateway
    column :direction
    column :amount
    column :comment

    column :created_at
    actions
  end

  filter :deposit
  filter :gateway
  filter :direction
  filter :comment
  filter :created_at

  form do |f|
    f.inputs 'Transaction Details' do
      f.input :amount
      f.input :deposit
      f.input :gateway
      f.input :direction, as: :select, collection: Transaction.directions
      f.input :comment
    end
    f.actions
  end
end
