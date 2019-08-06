class DirectorsController < ApplicationController
  def index
    directors = Director.all.order({ :name => :asc })

    render({ :json => directors.as_json })
  end

  def show
    the_id = params.fetch(:fr_director_id)
    director = Director.where({ :id => the_id }).at(0)

    render({ :json => director.as_json })
  end

  def create
    director = Director.new

    director.name = params.fetch(:qs_name, nil)
    director.dob = params.fetch(:qs_dob, nil)
    director.bio = params.fetch(:qs_bio, nil)
    director.image_url = params.fetch(:qs_image_url, nil)

    director.save

    render({ :json => director.as_json })
  end

  def update
    the_id = params.fetch(:fr_director_id)
    director = Director.where({ :id => the_id }).at(0)

    director.name = params.fetch(:qs_name, director.name)
    director.dob = params.fetch(:qs_dob, director.dob)
    director.bio = params.fetch(:qs_bio, director.bio)
    director.image_url = params.fetch(:qs_image_url, director.image_url)
    
    director.save

    render({ :json => director.as_json })
  end

  def destroy
    the_id = params.fetch(:fr_director_id)
    director = Director.where({ :id => the_id }).at(0)

    director.destroy

    render({ :json => director.as_json })
  end

  def youngest
    director = Director.youngest
    
    render({ :json => director.as_json })
  end

  def eldest
    director = Director.eldest

    render({ :json => director.as_json })
  end
  
   def filmography
    the_id = params.fetch(:fr_director_id)
    director = Director.where({ :id => the_id }).at(0)

    movies = director.filmography.order({ :year => :asc })

    render({ :json => movies.as_json })
  end
end
