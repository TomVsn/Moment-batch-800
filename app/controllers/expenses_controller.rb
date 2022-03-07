class ExpensesController < ApplicationController
  def index
    @participant = Participant.find(params[:participant_id])
    @trip = @participant.trip
    # @expenses = Expense.where(participant: @participant)
    # Pour avoir toutes les dépenses mutuelles de ce trip || rajouter .sum(:amount) à la fin pour somme
    @sum_of_mutual_expenses = Expense.includes(participant: :trip)
                              .references(:trip)
                              .where(trips: { id: @participant.trip }, mutual: true).sum(:amount)
    @non_mutual_expenses = Expense.where(participant: @participant, mutual: false).references(:trip).sum(:amount)
    @details_expenses = Expense.includes(participant: :trip)
                        .references(:trip)
                        .where(trips: { id: @participant.trip })
    # A VOIR
    @non_mutual_expenses = Expense.where(participant: @participant, mutual: false).references(:trip).sum(:amount)
    ## Avoir tous les participants d'un trip => Participant.where(trip: @participant.trip)
    @participants_expenses = Participant.where(trip: @participant.trip)
    @total_per_participant = (@sum_of_mutual_expenses / @participants_expenses.count) + @non_mutual_expenses
  end

  def show
    @expense = Expense.find(params[:id])
    authorize @expense
  end

  def new
    @new_expense = Expense.new
    @participant = Participant.find(params[:participant_id])
    authorize @new_expense
  end

  def create
    @participant = Participant.find(params[:participant_id])
    @new_expense = Expense.new(expenses_params)
    @new_expense.participant = @participant
    authorize @new_expense
    if @new_expense.save!
      redirect_to trip_path(@participant.trip)
    else
      redirect_to trip_path(@participant.trip)
    end
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    @expense = Expense.find(params[:id])
    @participant = @expense.participant
    authorize @expense
    if @expense.save
      @expense.update(expenses_params)
      redirect_to trip_path(@participant.trip)
    else
      @trip = @participant.trip
      render "trips/show"
    end
  end

  def destroy
    @expense = Expense.find(params[:id])
    @participant = @expense.participant
    @expense.destroy
    authorize @expense
    redirect_to trip_path(@participant.trip)
  end

  private

  def expenses_params
    params.require(:expense).permit(:title, :amount, :total, :mutual, :participant_id)
  end
end
