require 'test_helper'

class ChronologyTestAnswerTest < ActiveSupport::TestCase

  def setup
    @chronology_test_answer = ChronologyTestAnswer.new(name: "template1",
                                                      answer: "1 2 3 4 5",
                                                      password: "foobar",
                                                      password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @chronology_test_answer.valid?
  end

  test "name should be present" do
    @chronology_test_answer.name = ""
    assert_not @chronology_test_answer.valid?
  end

  test "answer should be present" do
    @chronology_test_answer.answer = "     "
    assert_not @chronology_test_answer.valid?
  end

  test "answer validation should reject invalid inputs" do
    invalid_answers = ["d a s d ", "124 * 1 3", "ababababab"]
    invalid_answers.each do |invalid_answer|
      @chronology_test_answer.answer = invalid_answer
      assert_not @chronology_test_answer.valid?, "#{invalid_answer.inspect} should be invalid"
    end
  end

  test "name of answer template should be unique" do
    duplicate_answer_name = @chronology_test_answer.dup
    @chronology_test_answer.save
    assert_not duplicate_answer_name.valid?
  end

  test "password should be present (nonblank)" do
    @chronology_test_answer.password = @chronology_test_answer.password_confirmation = " " * 6
    assert_not @chronology_test_answer.valid?
  end

end
