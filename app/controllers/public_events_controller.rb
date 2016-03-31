class PublicEventsController < ApplicationController
  def show
    @public_event = PublicEvent.find(params[:id])
  end
end
