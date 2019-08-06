ActiveAdmin.register Movie do
  permit_params :title, :year, :duration, :description, :image_url
end
