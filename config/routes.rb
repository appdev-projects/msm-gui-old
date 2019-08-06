Rails.application.routes.draw do

  # Movie routes
  match("/movies/last_decade", :controller => "movies", :action => "last_decade", :via => "get")
  match("/movies/long", :controller => "movies", :action => "long", :via => "get")
  match("/movies/short", :controller => "movies", :action => "short", :via => "get")
  
  match("/movies", :controller => "movies", :action => "index", :via => "get")
  match("/movies/:movie_id", :controller => "movies", :action => "show", :via => "get")
  match("/post_movie", :controller => "movies", :action => "create", :via => "get")
  match("/patch_movie/:movie_id", :controller => "movies", :action => "update", :via => "get")
  match("/delete_movie/:movie_id", :controller => "movies", :action => "delete", :via => "get")
  
  match("/movies/:movie_id/director", :controller => "movies", :action => "director", :via => "get")
  match("/movies/:movie_id/characters", :controller => "movies", :action => "characters", :via => "get")
  match("/movies/:movie_id/cast", :controller => "movies", :action => "cast", :via => "get")

  
  # Directors routes

  match("/directors/youngest", :controller => "directors", :action => "youngest", :via => "get")
  match("/directors/eldest", :controller => "directors", :action => "eldest", :via => "get")
  
  match("/directors", :controller => "directors", :action => "index", :via => "get")
  match("/directors/:director_id", :controller => "directors", :action => "show", :via => "get")
  match("/post_director", :controller => "directors", :action => "create", :via => "get")
  match("/patch_director/:director_id", :controller => "directors", :action => "update", :via => "get")
  match("/delete_director/:director_id", :controller => "directors", :action => "delete", :via => "get")
  
  match("/directors/:director_id/filmography", :controller => "directors", :action => "filmography", :via => "get")


  # Actor routes
  match("/actors", :controller => "actors", :action => "index", :via => "get")
  match("/actors/:actor_id", :controller => "actors", :action => "show", :via => "get")
  match("/post_actor", :controller => "actors", :action => "create", :via => "get")
  match("/patch_actor/:actor_id", :controller => "actors", :action => "update", :via => "get")
  match("/delete_actor/:actor_id", :controller => "actors", :action => "delete", :via => "get")

  match("/actors/:actor_id/filmography", :controller => "actors", :action => "filmography", :via => "get")
  match("/actors/:actor_id/characters", :controller => "actors", :action => "characters", :via => "get")

  # Character routes
  match("/characters", :controller => "characters", :action => "index", :via => "get")
  match("/characters/:character_id", :controller => "characters", :action => "show", :via => "get")
  match("/post_character", :controller => "characters", :action => "create", :via => "get")
  match("/patch_character/:character_id", :controller => "characters", :action => "update", :via => "get")
  match("/delete_character/:character_id", :controller => "characters", :action => "delete", :via => "get")

  # ==========
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
