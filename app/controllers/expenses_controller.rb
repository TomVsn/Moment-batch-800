class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all
    @participant = Participant.find(params[:participant_id])
  end

  def show
    @expense = Expense.find(params[:expense_id])
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end
end
