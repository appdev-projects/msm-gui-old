ActiveAdmin.register Director do
  permit_params :dob, :name, :bio, :image_url
end
