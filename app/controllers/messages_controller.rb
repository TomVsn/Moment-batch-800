class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    @trip = Trip.find(params[:trip_id])
    @messages = Message.where(trip: @trip)
    @message = Message.find(params[:id])
  end

  def create
    @new_message = Message.new(message_params)
    @participant = Participant.find(params[:participant_id])
    @new_message.participant = @participant
    @trip = @participant.trip
    @new_message.trip = @trip
    authorize @new_message
    if @new_message.save
      redirect_to trip_path(@trip, anchor: "message-#{@new_message.id}")
    else
      redirect_to trip_path(@trip, anchor: "message-#{@new_message.id}")
    end
  end

  private

  def message_params
    params.require(:message).permit(:participant_id, :trip_id, :id, :content)
  end
end
