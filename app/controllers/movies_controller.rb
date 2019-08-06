class MoviesController < ApplicationController

  def index
    movies = Movie.all
    
    render({ :json => movies })
  end
  
  def show
    id = params.fetch(:movie_id)
    movie = Movie.where({ :id => id }).at(0)
    render({ :json => movie })
  end
  
  def create
    movie = Movie.new
    movie.title = params.fetch(:title)
    movie.year = params.fetch(:year)
    movie.duration = params.fetch(:duration)
    movie.image_url = params.fetch(:image_url, "")
    movie.director_id = params.fetch(:director_id)
    movie.save
    
    render({ :json => movie })
  end
  
  def update
    id = params.fetch(:movie_id)
    movie = Movie.where({ :id => id }).at(0)
    movie.title = params.fetch(:title)
    movie.year = params.fetch(:year)
    movie.duration = params.fetch(:duration)
    movie.image_url = params.fetch(:image_url)
    movie.director_id = params.fetch(:director_id)
    movie.save

    render({ :json => movie })
  end
  
  def destroy
    id = params.fetch(:movie_id)
    movie = Movie.where({ :id => id }).at(0)
    movie.destroy
    
    render({ :json => movie })
  end

  def last_decade
    render({ :json => Movie.last_decade })
  end
 
  def long
    render({ :json => Movie.long })
  end
 
  def short
    render({ :json => Movie.short })
  end
 
  def director
    id = params.fetch(:movie_id)
    movie = Movie.where({ :id => id }).at(0)
    render({ :json => movie.director })
  end
 
  def characters
    id = params.fetch(:movie_id)
    movie = Movie.where({ :id => id }).at(0)
    render({ :json => movie.characters })
  end
  
  def cast
    id = params.fetch(:movie_id)
    movie = Movie.where({ :id => id }).at(0)
    render({ :json => movie.cast })
  end
end
