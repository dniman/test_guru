module TestPassagesHelper
  TEST_PASSED = 85

  def passed_questions(test_passage)
    test_passage.correct_questions/test_passage.test.questions.count * 100
  end
end
