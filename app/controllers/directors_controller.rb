class DirectorsController < ApplicationController
  def index
    directors = Director.all

    render({ :json => directors })
  end

  def show
    id = params.fetch(:director_id)
    director = Director.where({ :id => id }).at(0)
    render({ :json => director })
  end

  def create
    director = Director.new
    director.name = params.fetch(:name)
    director.dob = params.fetch(:dob)
    director.bio = params.fetch(:bio)
    director.image_url = params.fetch(:image_url)
    director.save

    render({ :json => director })
  end

  def update
    id = params.fetch(:director_id)
    director.name = params.fetch(:name)
    director.dob = params.fetch(:dob)
    director.bio = params.fetch(:bio)
    director.image_url = params.fetch(:image_url)
    director.save

    render({ :json => director })

  end

  def destroy
    id = params.fetch(:director_id)
    director = Director.where({ :id => id }).at(0)
    director.destroy

    render({ :json => director })
  end

  def youngest
    id = params.fetch(:director_id)
    director = Director.where({ :id => id }).at(0)
    render({ :json => director.youngest })
  end

  def eldest
    id = params.fetch(:director_id)
    director = Director.where({ :id => id }).at(0)
    render({ :json => director.eldest })
  end
  
   def filmography
    id = params.fetch(:director_id)
    director = Director.where({ :id => id }).at(0)
    render({ :json => director.filmography })
  end
end
