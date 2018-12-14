module TestPassagesHelper
  TEST_PASSED = 85

  def passed_questions(test_passage)
    test_passage.correct_questions/test_passage.test.questions.count * 100
  end

  def test_passed?(test_passage)
    return true if passed_questions(test_passage) >= TEST_PASSED 
    false
  end
end
