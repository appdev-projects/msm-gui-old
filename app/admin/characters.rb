ActiveAdmin.register Character do
  permit_params :movie_id, :actor_id, :name
end
