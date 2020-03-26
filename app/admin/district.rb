ActiveAdmin.register District do
  permit_params :name, :lat, :lng

  form do |f|
    f.inputs do
      f.input :name
      f.input :lat
      f.input :lng
    end
    f.actions
  end

end
