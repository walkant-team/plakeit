class HomeController < ApplicationController
  def index
    events = PublicEvent.order(:start_at)
    @weekly_events = events.weekly
    @public_events = events.page(params[:page]).per(10)
  end

  def show
    @public_event = PublicEvent.find(params[:id])
  end
end
