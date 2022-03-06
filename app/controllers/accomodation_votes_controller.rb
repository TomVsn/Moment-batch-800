class AccomodationVotesController < ApplicationController
  def new
    @accomodation = Accomodation.find(params[:accomodation_id])
    @new_accomodation_vote = AccomodationVote.new
  end

  def create
    @accomodation = Accomodation.find(params[:accomodation_id])
    @participant = Participant.find_by(user: current_user, trip: @accomodation.trip)
    @votes = @accomodation.accomodation_votes.count
    @new_accomodation_vote = AccomodationVote.new(participant: @participant, accomodation: @accomodation, vote: @votes +=1 )
    @new_accomodation_vote.save!
    authorize @new_accomodation_vote
    redirect_to trip_path(@accomodation.trip)
  end

  def destroy
    @accomodation_vote = AccomodationVote.find(params[:accomodation_id])
    @accomodation = @accomodation_vote.accomodation
    @accomodation_vote.destroy
    authorize @accomodation_vote
    redirect_to trip_path(@accomodation.trip)
  end

  # private

  # def accomodation_params
  #   params.require(:accomdation).permit(:accomodation_id)
  # end

  # def accomodation_votes_params
  #   params.require(:accomdation_vote).permit(:accomodation_vote_id)
  # end
end
