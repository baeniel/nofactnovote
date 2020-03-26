ActiveAdmin.register User do

  permit_params :password, :password_confirmation, :party, :name, :age, :district_id, :image

  index do
    selectable_column
    id_column
    column :name
    column :image do |user|
      image_tag(user.image_url, class: 'admin-index-image')
    end
    column :party
    column :age
    column "district" do |d|
      d.district.name
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row :image
      row :party
      row :age
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :party
      f.input :age
      f.input :district
      f.input :image
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
