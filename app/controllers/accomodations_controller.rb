class AccomodationsController < ApplicationController

  def index
    @trip = Trip.find(params[:trip_id])
    @accomodations = policy_scope(@trip.accomodations)
  end

  def show
    @accomodation = Accomodation.find(params[:id])
    @duration = (@accomodation.trip.end_date - @accomodation.trip.start_date)/86400
    @trip = @accomodation.trip
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @accomodation = Accomodation.new
    authorize @accomodation
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @new_accomodation = Accomodation.new(accomodations_params)
    authorize @new_accomodation
    @new_accomodation.trip = @trip
    if @new_accomodation.save!
      AccomodationVote.create(accomodation: @new_accomodation, participant: @participant)
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  def edit
    @accomodation = Accomodation.find(params[:id])
  end

  def update
    @accomodation = Accomodation.find(params[:id])
    @accomodation.update(accomodations_params)
    redirect_to accomodations_path
  end

  def destroy
    @accomodation = Accomodation.find(params[:id])
    authorize @accomodation
    @trip = @accomodation.trip
    @accomodation.accomodation_votes.destroy_all
    @accomodation.destroy
    redirect_to trip_path(@trip)
  end

  def confirm_accomodation
    @accomodation = Accomodation.find(params[:id])
    if @accomodation.confirmed == true
      @accomodation.update(confirmed: false)
    else
      @accomodation.update(confirmed: true)
    end
    authorize @accomodation
    @trip = @accomodation.trip
    redirect_to trip_path(@trip)
  end

  private

  def accomodations_params
    params.require(:accomodation).permit(:confirmed, :address, :url, :picked, :trip_id, :id, :title, :description, :price, :img)
  end
end
