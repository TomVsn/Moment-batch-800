class TransportationsController < ApplicationController
  def index
    @transportations = Transportation.all
  end

  def show
    @transportation = Transportation.find(params[:id])
  end

  def new
    @transportation = Transportation.new
    @participant = Participant.find(params[:participant_id])
  end

  def create
    @transportation = Transportation.new(transportations_params)
    @participant = Participant.find(params[:participant_id])
    @transportation.participant = @participant
    if @transportation.save
      redirect_to transportations_path
    else
      render :new
    end
  end

  def edit
    @transportation = Transportation.find(params[:id])
  end

  def update
    @transportation = Transportation.find(params[:id])
    @transportation.update(transportations_params)
    redirect_to transportations_params
  end

  def destroy
    @transportation = Transportation.find(params[:id])
    @transportation.destroy
    redirect_to transportations_params
  end

  private

  def transportations_params
    params.require(:transportation).permit(:price, :origin, :mean, :destination, :departure_date, :departure_hour, :arrival_date, :arrival_hour)
  end
end
