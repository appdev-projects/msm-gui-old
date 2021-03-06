class MoviesController < ApplicationController
  def index
    movies = Movie.all.order({ :year => :asc })
    
    render({ :json => movies.as_json })
  end
  
  def show
    the_id = params.fetch(:fr_movie_id)
    movie = Movie.where({ :id => the_id }).at(0)

    render({ :json => movie.as_json })
  end
  
  def create
    movie = Movie.new

    movie.title = params.fetch(:qs_title, nil)
    movie.year = params.fetch(:qs_year, nil)
    movie.duration = params.fetch(:qs_duration, nil)
    movie.image_url = params.fetch(:qs_image_url, nil)
    movie.director_id = params.fetch(:qs_director_id, nil)

    movie.save
    
    render({ :json => movie.as_json })
  end
  
  def update
    the_id = params.fetch(:fr_movie_id)
    movie = Movie.where({ :id => the_id }).at(0)

    movie.title = params.fetch(:qs_title, movie.title)
    movie.year = params.fetch(:qs_year, movie.year)
    movie.duration = params.fetch(:qs_duration, movie.duration)
    movie.image_url = params.fetch(:qs_image_url, movie.image_url)
    movie.director_id = params.fetch(:qs_director_id, movie.director_id)

    movie.save

    render({ :json => movie.as_json })
  end
  
  def destroy
    the_id = params.fetch(:fr_movie_id)
    movie = Movie.where({ :id => the_id }).at(0)

    movie.destroy
    
    render({ :json => movie.as_json })
  end

  def last_decade
    movies = Movie.last_decade.order({ :year => :desc })

    render({ :json => Movie.last_decade.as_json })
  end
 
  def long
    movies = Movie.long.order({ :duration => :desc })

    render({ :json => movies.as_json })
  end
 
  def short
    movies = Movie.short.order({ :duration => :asc })

    render({ :json => movies.as_json })
  end
 
  def director
    the_id = params.fetch(:fr_movie_id)
    movie = Movie.where({ :id => the_id }).at(0)

    the_director = movie.director

    render({ :json => the_director.as_json })
  end
 
  def characters
    the_id = params.fetch(:fr_movie_id)
    movie = Movie.where({ :id => the_id }).at(0)
    
    the_characters = movie.characters.order({ :name => :asc })

    render({ :json => the_characters.as_json })
  end
  
  def cast
    the_id = params.fetch(:fr_movie_id)
    movie = Movie.where({ :id => the_id }).at(0)

    actors = movie.cast.order({ :name => :asc })

    render({ :json => actors.as_json })
  end
end
