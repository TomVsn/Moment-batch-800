class EventsController < ApplicationController

  def index
    # @events = Event.all
    @events = policy_scope(Event).order(created_at: :desc)
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @participant = Participant.find(params[:participant_id])
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @participant = Participant.find(params[:participant_id])
    @event.participant = @participant
    @event.trip = @participant.trip
    authorize @event
    if @event.save
      EventParticipant.create(event: @event, participant: @participant)
      redirect_to trip_path(@participant.trip)
    else
      @trip = @participant.trip
      render "trips/show"
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @participant = @event.participant
    # @event.update(event_params)
    # redirect_to events_path
    authorize @event
    if @event.save
      @event.update(event_params)
      redirect_to trip_path(@participant.trip)
    else
      @trip = @participant.trip
      render "trips/show"
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @participant = @event.participant
    authorize @event
    @event.destroy
    redirect_to trip_path(@participant.trip)
    # redirect_to trip_path
  end

  private

  def event_params
    params.require(:event).permit(:description, :start_date, :end_date)
  end
end
