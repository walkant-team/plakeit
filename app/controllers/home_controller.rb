class HomeController < ApplicationController
  def index
    @public_events = PublicEvent.order(:start_at).page(params[:page]).per(10)
  end

  def show
    @public_event = PublicEvent.find(params[:id])
  end
end
