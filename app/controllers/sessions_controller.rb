class SessionsController < ApplicationController
  def new
  end

  def create
    chronology_test_answer = ChronologyTestAnswer.find_by(name: params[:session][:name])
    if chronology_test_answer && chronology_test_answer.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in_chronology_test(chronology_test_answer)
      redirect_to chronology_test_answer
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  end

end
