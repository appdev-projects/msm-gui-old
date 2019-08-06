class CharactersController < ApplicationController

  def index
    characters = Character.all

    render({ :json => characters })
  end

  def show
    id = params.fetch(:character_id)
    character = Character.where({ :id => id }).at(0)
    render({ :json => character })
  end

  def create
    character = Character.new
    character.name = params.fetch(:name)
    character.actor_id = params.fetch(:actor_id)
    character.movie_id = params.fetch(:movie_id)
    character.save

    render({ :json => character })
  end

  def update
    id = params.fetch(:character_id)
    character = Character.where({ :id => id }).at(0)
    character.name = params.fetch(:name)
    character.actor_id = params.fetch(:actor_id)
    character.movie_id = params.fetch(:movie_id)
    character.save

    render({ :json => character })

  end

  def destroy
    id = params.fetch(:character_id)
    character = Character.where({ :id => id }).at(0)
    character.destroy

    render({ :json => character })

  end
end
