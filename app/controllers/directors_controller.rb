class DirectorsController < ApplicationController
  def index
    @directors = Director.all.order({ :name => :asc })

    respond_to do |format|
      format.html { render({ :template => "index" }) }
      format.json { render({ :json => @directors.as_json }) }
    end
  end

  def show
    the_id = params.fetch(:director_id)
    @director = Director.where({ :id => the_id }).at(0)

    respond_to do |format|
      format.html { render({ :template => "show" }) }
      format.json { render({ :json => @director.as_json }) }
    end
  end

  def create
    director = Director.new

    director.name = params.fetch(:name, nil)
    director.dob = params.fetch(:dob, nil)
    director.bio = params.fetch(:bio, nil)
    director.image_url = params.fetch(:image_url, nil)

    director.save

    respond_to do |format|
      format.html { redirect_to("/directors/#{director.id}") }
      format.json { render({ :json => director.as_json }) }
    end
  end

  def update
    the_id = params.fetch(:director_id)
    director = Director.where({ :id => the_id }).at(0)

    director.name = params.fetch(:name, director.name)
    director.dob = params.fetch(:dob, director.dob)
    director.bio = params.fetch(:bio, director.bio)
    director.image_url = params.fetch(:image_url, director.image_url)
    
    director.save

    respond_to do |format|
      format.html { redirect_to("/directors/#{director.id}") }
      format.json { render({ :json => director.as_json }) }
    end
  end

  def destroy
    the_id = params.fetch(:director_id)
    director = Director.where({ :id => the_id }).at(0)

    director.destroy

    respond_to do |format|
      format.html { redirect_to("/directors") }
      format.json { render({ :json => director.as_json }) }
    end
  end

  def youngest
    @director = Director.youngest
    
    respond_to do |format|
      format.html { render({ :template => "show" })  }
      format.json { render({ :json => @director.as_json }) }
    end
  end

  def eldest
    @director = Director.eldest

    respond_to do |format|
      format.html { render({ :template => "show" })  }
      format.json { render({ :json => @director.as_json }) }
    end
  end
  
   def filmography
    the_id = params.fetch(:director_id)
    director = Director.where({ :id => the_id }).at(0)

    @movies = director.filmography.order({ :year => :asc })

    respond_to do |format|
      format.html { render({ :template => "../movies/index" })  }
      format.json { render({ :json => @director.as_json }) }
    end
  end
end
