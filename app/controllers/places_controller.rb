class PlacesController < ApplicationController
  def index
    #render :template => "places/index"
    @places = Place.all
  end
  def show
    @places = Place.find_by({"id" => params["id"]})

  end
  def create
  @places = Place.new
  @places["name"] = params["name"]
  @places.save
  redirect_to "/places"
  end
end
