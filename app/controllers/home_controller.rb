class HomeController < ApplicationController
  def index
    @public_events = PublicEvent.all
  end

  def show
    @public_event = PublicEvent.find(params[:id])
  end
end
