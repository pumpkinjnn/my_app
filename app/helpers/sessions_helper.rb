module SessionsHelper

  def log_in_chronology_test(chronology_test_answer)
    session[:chronology_test_answer_id] = chronology_test_answer.id
  end
end
