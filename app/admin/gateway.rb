ActiveAdmin.register Gateway do
  permit_params :name, :access_token

  index do
    selectable_column
    id_column
    column :name
    column :access_token
    actions
  end

  filter :name
  filter :created_at

  form do |f|
    f.inputs 'Gateway Details' do
      f.input :name
    end
    f.actions
  end
end
