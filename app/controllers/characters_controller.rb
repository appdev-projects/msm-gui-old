class CharactersController < ApplicationController

  def index
    characters = Character.all.order({ :created_at => :asc })

    render({ :json => characters.as_json })
  end

  def show
    the_id = params.fetch(:character_id)
    character = Character.where({ :id => the_id }).at(0)

    render({ :json => character.as_json })
  end

  def create
    character = Character.new

    character.name = params.fetch(:name, nil)
    character.actor_id = params.fetch(:actor_id, nil)
    character.movie_id = params.fetch(:movie_id, nil)

    character.save

    render({ :json => character.as_json })
  end

  def update
    the_id = params.fetch(:character_id)
    character = Character.where({ :id => the_id }).at(0)

    character.name = params.fetch(:name, character.name)
    character.actor_id = params.fetch(:actor_id, character.actor_id)
    character.movie_id = params.fetch(:movie_id, character.movie_id)
    
    character.save

    render({ :json => character.as_json })
  end

  def destroy
    the_id = params.fetch(:character_id)
    character = Character.where({ :id => the_id }).at(0)

    character.destroy

    render({ :json => character.as_json })
  end
end
