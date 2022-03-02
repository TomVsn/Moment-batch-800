class AccomodationsController < ApplicationController

  def index
    @accomodations = Accomodation.all
  end

  def show
    @accomodation = Accomodation.find(params[:id])
  end

  def new
    @accomodation = Accomodation.new
    @trip = Trip.find(params[:trip_id])
  end

  def create
    @accomodation = Accomodation.new(accomodations_params)
    @trip = Trup.find(params[:trip_id])
    @accomodation.trip = @trip
    if @accomodation.save
      redirect_to accomodations_path
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
    @accomodation.destroy
    redirect_to accomodations_path
  end

  private

  def accomodations_params
    params.require(:accomodation).permit(:confirmed, :address, :url, :picked)
  end
end
