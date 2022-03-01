class TripsController < ApplicationController
  # def index
  #   @trips = policy_scope(Trip).order(created_at: :desc)
  # end

  def index
    @index = Trip.all
  end

end
