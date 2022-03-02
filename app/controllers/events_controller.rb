class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    authorize @event
  end

  def new
    @participant = Participant.find(params[:participant_id])
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    @participant = Participant.find(params[:participant_id])
    @event.participant = @participant
    if @event.save
      @event_participant = EventParticipant.new(event: @event, participant: @participant)
      redirect_to event_path
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
    authorize @event
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    authorize @event
    redirect_to event_path
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    authorize @event
    redirect_to trip_path
  end

  private

  def event_params
    params.require(:event).permit(:description, :start_date, :end_date, :start_hour, :end_hour, :event_participants)
  end
end
