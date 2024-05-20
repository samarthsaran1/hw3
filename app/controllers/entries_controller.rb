class EntriesController < ApplicationController
  
#creates new form for places
  def new
    @place = Place.find_by({"id" => params["place_id"]})
  end
  
#assigns inputs from entries page and creates new array in entry hash 
  def create
    @entry = Entry.new
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["posted_on"] = params["date"]

   # links entry to place based on ID,saves entry and then redirects to places homepage
    @entry["place_id"] = params["place_id"]
    @entry.save
    redirect_to "/places/#{@entry["place_id"]}"
  end
end