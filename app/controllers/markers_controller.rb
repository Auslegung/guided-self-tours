class MarkersController < ApplicationController
  def show
    marker = Marker.find(params[:id])
    render json:
    {
      status: 200,
      marker: marker,
    }
  end

  def index
    markers = Marker.all
    render json: markers
  end
end
