class TransportationsController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    first_step = @trip.participants.map do |participant|
      participant.transportations
    end
    # @transportations = first_step.flatten
    @participant = Participant.where(user_id: current_user.id, trip_id: @trip.id).first
    @time_remaining = @participant.transportations.first.departure_date - Time.now
  end

  def show
    @transportation = Transportation.find(params[:id])
    @trip = @transportation.participant.trip
  end

  def new
    @transportation = Transportation.new
    @participant = Participant.find(params[:participant_id])
    # user_id: current_user.id, trip_id:@trip.id).first
  end

  def create
    @participant = Participant.find(params[:participant_id])
    @new_transportation = Transportation.new(transportations_params)
    # @participant = Participant.where(user_id: current_user.id, trip_id:@trip.id).first
    @new_transportation.participant = @participant
    if @new_transportation.save
      redirect_to trip_path(@participant.trip)
    else
      redirect_to trip_path(@participant.trip)
    end
    authorize @new_transportation
  end

  def edit
    @transportation = Transportation.find(params[:id])
    @participant = @transportation.participant
  end

  def update
    @transportation = Transportation.find(params[:id])
    @transportation.update(transportations_params)
    authorize @transportation
    redirect_to trip_path(@transportation.participant.trip)
  end


  private

  def transportations_params
    params.require(:transportation).permit(:price, :origin, :mean, :destination, :departure_date, :departure_hour, :arrival_date, :arrival_hour, :participant_id)
  end
end
