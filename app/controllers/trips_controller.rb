class TripsController < ApplicationController
  # def index
  # end

  def index
    @trips = Trip.all
    @trips = policy_scope(Trip).order(created_at: :desc)
  end

  def show
    @trip = Trip.find(params[:id])
    @transportations = @trip.transportations
    @messages = @trip.messages
    @events = @trip.events
    # @event_id = Event.find(params[:id])
    @event_participant = EventParticipant.new
    @event = Event.new
    @participants = @trip.participants
    @participant = @participants.find_by(user: current_user)
    authorize @trip
  end

  def new
    @trip = Trip.new
    authorize @trip
  end

  def create
    @trip = Trip.new(trip_params)
    authorize @trip
    if @trip.save
      @participant = Participant.new(user: current_user, trip: @trip)
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  def edit
    @trip = Trip.find(params[:id])
    authorize @trip
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.update(trip_params)
    authorize @trip
    redirect_to trip_path
  end

  def destroy
    @trip = Trip.find(params[:id])
    authorize @trip
    @trip.destroy
    redirect_to trips_path
  end

  private

  def trip_params
    params.require(:trip).permit(:start_date, :end_date, :title, :description, :city, :participants, :transportations, :messages, :events)
  end
end
