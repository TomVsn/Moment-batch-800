class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all
    @participant = Participant.find(params[:participant_id])
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
      redirect_to expense_path
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

  def participant_params
    params.require(:expense).permit(:amount, :total, :mutual)
  end
end
