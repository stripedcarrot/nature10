class GeolocateController < ApplicationController

  def show
    @photos = Photo.all
  end
end
