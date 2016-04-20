class RemindersController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    current_user.events << event
    render nothing: true
  rescue ActiveRecord::RecordInvalid => e
    logger.debug e.record.errors.messages
    render nothing: true
  end
end
