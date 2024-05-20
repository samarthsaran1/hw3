class EntriesController < ApplicationController
  
  def new
    @place = Place.find_by({"id" => params["place_id"]})
  end
  
  def create
    @entry = Entry.new
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["posted_on"] = params["date"]
    @entry["place_id"] = params["place_id"]
    
    @entry.save
  
    redirect_to "/places/#{@entry["place_id"]}"
  end
end