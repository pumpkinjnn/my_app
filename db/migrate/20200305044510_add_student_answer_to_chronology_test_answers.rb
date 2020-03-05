class AddStudentAnswerToChronologyTestAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :chronology_test_answers, :student_answer, :string
  end
end
