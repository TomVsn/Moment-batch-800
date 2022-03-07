class ParticipantsController < ApplicationController

  def index
    @trip = Trip.find(params[:trip_id])
    @participants = policy_scope(@trip.participants)
  end

  def show
    @participant = Participant.find(params[:id])
  end

  def new
    @trip = Trip.find(params[:id])
    @participant = Participant.new
    authorize @participant
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @participant = Participant.new(participant_params)
    authorize @participant
    if @participant.save
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  def destroy
    # @trip = Trip.find(params[:trip_id])
    @participant = Participant.find(params[:id])
    @trip = @participant.trip
    @participant.destroy
    authorize @participant
    redirect_to trips_path
  end

  private

  def participant_params
    params.require(:participant).permit(:user_id, :trip_id)
  end
end
