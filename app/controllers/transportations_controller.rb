class TransportationsController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    first_step = @trip.participants.map do |participant|
      participant.transportations
    end
    @transportations = first_step.flatten
    @participant = Participant.where(user_id: current_user.id, trip_id:@trip.id).first
  end

  def show
    @transportation = Transportation.find(params[:id])
    @trip =  @transportation.participant.trip
  end

  def new
    @transportation = Transportation.new
    @participant = Participant.find(params[:participant_id])
    # user_id: current_user.id, trip_id:@trip.id).first
  end

  def create
    @transportation = Transportation.new(transportations_params)
    @participant = Participant.find(params[:participant_id])
    # @participant = Participant.where(user_id: current_user.id, trip_id:@trip.id).first
    @transportation.participant = @participant
    if @transportation.save
      redirect_to transportation_path(@transportation)
    else
      render :new
    end
  end

  def edit
    @transportation = Transportation.find(params[:id])
    @participant = @transportation.participant
  end

  def update
    @transportation = Transportation.find(params[:id])
    @transportation.update(transportations_params)
    redirect_to transportations_params
  end


  private

  def transportations_params
    params.require(:transportation).permit(:price, :origin, :mean, :destination, :departure_date, :departure_hour, :arrival_date, :arrival_hour, :participant_id)
  end
end
