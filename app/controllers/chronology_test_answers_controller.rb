class ChronologyTestAnswersController < ApplicationController

  def show
    @chronology_test_answer = ChronologyTestAnswer.find(params[:id])
  end

  def new
    @chronology_test_answer = ChronologyTestAnswer.new
  end

  def create
    @chronology_test_answer = ChronologyTestAnswer.new(chronology_test_answer_params)
    if @chronology_test_answer.save
      #handle successful save
      redirect_to @chronology_test_answer
    else
      render 'new'
    end
  end

  private

    def chronology_test_answer_params
      params.require(:chronology_test_answer).permit(:name, :answer, :password,
                                                    :password_confirmation)
    end
end
