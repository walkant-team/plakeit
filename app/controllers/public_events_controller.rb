class PublicEventsController < ApplicationController
  impressionist actions: [:show], unique: [:session_hash, :impressionable_type, :impressionable_id]

  def show
    @public_event = PublicEvent.find(params[:id])
  end
end
