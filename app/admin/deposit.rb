ActiveAdmin.register Deposit do
  permit_params :user, :amount

  index do
    selectable_column
    id_column
    column :user
    column :amount
    column :created_at
    actions
  end

  filter :user
  filter :created_at

  form do |f|
    f.inputs 'Deposit Details' do
      f.input :user, as: :select, collection: User.all.map(&:email)
      f.input :amount
    end
    f.actions
  end
end
