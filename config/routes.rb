Rails.application.routes.draw do
  match("/", { :controller => "movies", :action => "index", :via => "get" })

  # Movie routes

  # CREATE
  match("/post_movie", :controller => "movies", :action => "create", :via => "get")

  # READ
  match("/movies", :controller => "movies", :action => "index", :via => "get")
  match("/movies/last_decade", :controller => "movies", :action => "last_decade", :via => "get")
  match("/movies/long", :controller => "movies", :action => "long", :via => "get")
  match("/movies/short", :controller => "movies", :action => "short", :via => "get")
  
  match("/movies/:fr_movie_id", :controller => "movies", :action => "show", :via => "get")
  match("/movies/:fr_movie_id/director", :controller => "movies", :action => "director", :via => "get")
  match("/movies/:fr_movie_id/characters", :controller => "movies", :action => "characters", :via => "get")
  match("/movies/:fr_movie_id/cast", :controller => "movies", :action => "cast", :via => "get")

  # UPDATE
  match("/patch_movie/:fr_movie_id", :controller => "movies", :action => "update", :via => "get")

  # DELETE
  match("/delete_movie/:fr_movie_id", :controller => "movies", :action => "delete", :via => "get")
  

  
  # Director routes

  # CREATE
  match("/post_director", :controller => "directors", :action => "create", :via => "get")

  # READ
  match("/directors", :controller => "directors", :action => "index", :via => "get")
  match("/directors/youngest", :controller => "directors", :action => "youngest", :via => "get")
  match("/directors/eldest", :controller => "directors", :action => "eldest", :via => "get")
  
  match("/directors/:fr_director_id", :controller => "directors", :action => "show", :via => "get")
  match("/directors/:fr_director_id/filmography", :controller => "directors", :action => "filmography", :via => "get")

  # UPDATE
  match("/patch_director/:fr_director_id", :controller => "directors", :action => "update", :via => "get")
  
  # DELETE
  match("/delete_director/:fr_director_id", :controller => "directors", :action => "delete", :via => "get")
  
  # Actor routes

  # CREATE
  match("/post_actor", :controller => "actors", :action => "create", :via => "get")

  # READ
  match("/actors", :controller => "actors", :action => "index", :via => "get")

  match("/actors/:fr_actor_id", :controller => "actors", :action => "show", :via => "get")
  match("/actors/:fr_actor_id/filmography", :controller => "actors", :action => "filmography", :via => "get")
  match("/actors/:fr_actor_id/characters", :controller => "actors", :action => "characters", :via => "get")

  # UPDATE
  match("/patch_actor/:fr_actor_id", :controller => "actors", :action => "update", :via => "get")

  # DELETE
  match("/delete_actor/:fr_actor_id", :controller => "actors", :action => "delete", :via => "get")

  # Character routes

  # CREATE
  match("/post_character", :controller => "characters", :action => "create", :via => "get")

  # READ
  match("/characters", :controller => "characters", :action => "index", :via => "get")
  match("/characters/:fr_character_id", :controller => "characters", :action => "show", :via => "get")

  # UPDATE
  match("/patch_character/:fr_character_id", :controller => "characters", :action => "update", :via => "get")

  # DELETE
  match("/delete_character/:fr_character_id", :controller => "characters", :action => "delete", :via => "get")

  # ==========
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
