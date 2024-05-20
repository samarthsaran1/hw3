class PlacesController < ApplicationController

#index action to link places hash
  def index
    @places = Place.all
  end

#show action to (a) display the appropriate place by looking up the ID based on which place is selected (b) show detailed view of place (with entries) 
  def show
    @places = Place.find_by({"id" => params["id"]})
    @entries = Entry.where({"place_id" => @places["id"]})

  end

  def new
    #new action to create new place from form
  end

  #create action to make a new place, assign input name to the place, save it and then redirect to places homepage
  def create
  @place = Place.new
  @place["name"] = params["name"]
  @place.save
  redirect_to "/places"
  end
end
