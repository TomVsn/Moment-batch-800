class ExpensesController < ApplicationController
  def index
    @participant = Participant.find(params[:participant_id])
    @expenses = Expense.where(participant: @participant)
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def new
    @expense = Expense.new
    @participant = Participant.find(params[:participant_id])
  end

  def create
    @expense = Expense.new(expenses_params)
    @participant = Participant.find(params[:participant_id])
    @expense.participant = @participant
    if @expense.save
      redirect_to expense_path(@expense)
    else
      render :new
    end
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    @expense = Expense.find(params[:id])
    @expense = Expense.update(expenses_params)
    redirect_to expense_path
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy
    redirect_to expenses_path
  end

  private

  def expenses_params
    params.require(:expense).permit(:title, :amount, :total, :mutual)
  end
end
