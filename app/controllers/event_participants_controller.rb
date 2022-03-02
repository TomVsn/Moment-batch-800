class EventParticipantsController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @event_participant = EventParticipant.new
  end

  def create
    # @event_participant = EventParticipant.new(event_participant_params)
    # @event = Event.find(params[:event_id])
    # @event_participant.event = @event
    # @event_participant.participant = @participant
    @event = Event.find(params[:event_id])
    @participant = Participant.find_by(user: current_user, trip: @event.trip)
    @event_participant = EventParticipant.new(participant: @participant, event: @event)
    @event_participant.save
    redirect_to trip_path(@event.trip)
  end

  def destroy
    @event_participant = EventParticipant.find(params[:event_id])
    @event_participant.destroy
    redirect_to trips_path
  end

  private

  def event_participant_params
    params.require(:event_participant).permit(:participant_id, :event_id)
  end
end
