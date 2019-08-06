class ActorsController < ApplicationController
  def index
    actors = Actor.all

    render({ :json => actors })
  end

  def show
    id = params.fetch(:actor_id)
    actor = Actor.where({ :id => id }).at(0)
    render({ :json => actor })
  end

  def create
    actor = Actor.new
    actor.name = params.fetch(:name)
    actor.dob = params.fetch(:dob)
    actor.bio = params.fetch(:bio)
    actor.image_url = params.fetch(:image_url)
    actor.save

    render({ :json => actor })
  end

  def update
    id = params.fetch(:actor_id)
    actor = Actor.where({ :id => id }).at(0)
    actor.name = params.fetch(:name)
    actor.dob = params.fetch(:dob)
    actor.bio = params.fetch(:bio)
    actor.image_url = params.fetch(:image_url)
    actor.save

    render({ :json => actor })

  end

  def destroy
    id = params.fetch(:actor_id)
    actor = Actor.where({ :id => id }).at(0)
    actor.destroy

    render({ :json => actor })

  end
  
  def filmography
    id = params.fetch(:actor_id)
    actor = Actor.where({ :id => id }).at(0)
    
    render({ :json => actor.filmography })
  end
  
  def characters
    id = params.fetch(:actor_id)
    actor = Actor.where({ :id => id }).at(0)
    
    render({ :json => actor.characters })
  end
end
