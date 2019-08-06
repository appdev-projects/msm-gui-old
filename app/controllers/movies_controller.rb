class MoviesController < ApplicationController
  def index
    @movies = Movie.all.order({ :year => :asc })
    
    respond_to do |format|
      format.html { render({ :template => "movies/index" }) }
      format.json { render({ :json => @movies.as_json }) }
    end
  end
  
  def show
    the_id = params.fetch(:movie_id)
    @movie = Movie.where({ :id => the_id }).at(0)

   respond_to do |format|
      format.html { render({ :template => "movies/show" }) }
      format.json { render({ :json => @movie.as_json }) }
    end
  end
  
  def create
    movie = Movie.new

    movie.title = params.fetch(:input_title, nil)
    movie.year = params.fetch(:input_year, nil)
    movie.duration = params.fetch(:input_duration, nil)
    movie.image_url = params.fetch(:input_image_url, nil)
    movie.director_id = params.fetch(:input_director_id, nil)

    movie.save
    
    respond_to do |format|
      format.html { redirect_to("/movies/#{movie.id}") }
      format.json { render({ :json => movie.as_json }) }
    end
  end
  
  def update
    the_id = params.fetch(:movie_id)
    movie = Movie.where({ :id => the_id }).at(0)

    movie.title = params.fetch(:input_title, movie.title)
    movie.year = params.fetch(:input_year, movie.year)
    movie.duration = params.fetch(:input_duration, movie.duration)
    movie.image_url = params.fetch(:input_image_url, movie.image_url)
    movie.director_id = params.fetch(:input_director_id, movie.director_id)

    movie.save

    respond_to do |format|
      format.html { redirect_to("/movies/#{movie.id}") }
      format.json { render({ :json => movie.as_json }) }
    end
  end
  
  def destroy
    the_id = params.fetch(:movie_id)
    movie = Movie.where({ :id => the_id }).at(0)

    movie.destroy
    
    respond_to do |format|
      format.html { redirect_to("/movies") }
      format.json { render({ :json => movie.as_json }) }
    end
  end

  def last_decade
    @movies = Movie.last_decade.order({ :year => :desc })

    respond_to do |format|
      format.html { render({ :template => "movies/index" }) }
      format.json { render({ :json => @movies.as_json }) }
    end
  end
 
  def long
    @movies = Movie.long.order({ :duration => :desc })

    respond_to do |format|
      format.html { render({ :template => "movies/index" }) }
      format.json { render({ :json => @movies.as_json }) }
    end
  end
 
  def short
   @movies = Movie.short.order({ :duration => :asc })

    respond_to do |format|
      format.html { render({ :template => "movies/index" }) }
      format.json { render({ :json => @movies.as_json }) }
    end
  end
 
  def director
    the_id = params.fetch(:movie_id)
    movie = Movie.where({ :id => the_id }).at(0)

    @the_director = movie.director

    respond_to do |format|
      format.html { render({ :template => "directors/show" }) }
      format.json { render({ :json => @the_director.as_json }) }
    end
  end
 
  def characters
    the_id = params.fetch(:movie_id)
    movie = Movie.where({ :id => the_id }).at(0)
    
    @the_characters = movie.characters.order({ :name => :asc })

    respond_to do |format|
      format.html { render({ :template => "characters/index" }) }
      format.json { render({ :json => @the_characters.as_json }) }
    end
  end
  
  def cast
    the_id = params.fetch(:movie_id)
    movie = Movie.where({ :id => the_id }).at(0)

    @actors = movie.cast.order({ :name => :asc })

    respond_to do |format|
      format.html { render({ :template => "actors/index" }) }
      format.json { render({ :json => @actors.as_json }) }
    end
  end
end
