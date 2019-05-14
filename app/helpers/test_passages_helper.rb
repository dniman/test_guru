module TestPassagesHelper
  def result(test_passage)
    if test_passage.success?
      t(".test_completed", correct_questions: test_passage.correct_questions)
    else
      t(".test_failed", correct_questions: test_passage.correct_questions)
    end
  end
end
