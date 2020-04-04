ActiveAdmin.register User do

  permit_params :password, :password_confirmation, :party, :name, :district_id, :image, :policy

  index do
    selectable_column
    id_column
    column :name
    column :image do |user|
      image_tag(user.image_url, class: 'admin-index-image')
    end
    column :party
    column :policy
    column "district" do |d|
      d.district.name
    end
    column :view
    column :link1
    column :link2
    column :link3
    actions
  end

  show do
    attributes_table do
      row :name
      row :image
      row :party
      row :policy
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :party
      f.input :policy
      f.input :district
      f.input :image
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
