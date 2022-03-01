class EventParticipantsController < ApplicationController
  def new
    @event_participant = EventParticipant.new
    @event = Event.find(params[:event_id])
  end

  def create
    @event_participant = EventParticipant.new(event_participant_params)
    @event = Event.find(params[:event_id])
    @event_participant.event = @event
    @event_participant.save
    redirect_to trip_path
  end

  def destroy
    @event_participant = EventParticipant.find(params[:event_id])
    @event_participant.destroy
    redirect_to trip_path
  end

  private

  def event_participant_params
    params.require(:event_participant).permit(:participant_id)
  end
end
