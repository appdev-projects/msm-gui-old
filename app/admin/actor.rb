ActiveAdmin.register Actor do
  permit_params :dob, :name, :bio, :image_url
end
