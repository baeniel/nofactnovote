ActiveAdmin.register User do

  permit_params :password, :password_confirmation, :party, :name, :district_id, :image, :policy, :link1, :link2, :link3, :link4, :head1, :head2, :head3, :head4, :small_district

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
    column :visit
    column :link1
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
      f.input :link1
      f.input :link2
      f.input :link3
      f.input :link4
      f.input :head1
      f.input :head2
      f.input :head3
      f.input :head4
      f.input :small_district
    end
    f.actions
  end
end
