class ParticipantsController < ApplicationController
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
    @participant = Participant.find(params[:id])
    @participant.destroy
    authorize @participant
  end

  private

  def participant_params
    params.require(:participant).permit(:user_id, :trip_id)
  end
end
