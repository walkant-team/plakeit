class PublicEventsController < ApplicationController
  impressionist actions: [:show], unique: [:session_hash, :impressionable_type, :impressionable_id]
  before_action :current_user_js, only: :show

  def show
    @public_event = PublicEvent.find(params[:id])
    @assistants = @public_event.assistants(current_user)
    gon.event = @public_event
    @hash = Gmaps4rails.build_markers(@public_event) do |event, marker|
      marker.lat event.latitude
      marker.lng event.longitude
      marker.infowindow "<h6>#{event.location}</h6>"
    end
  end
end
