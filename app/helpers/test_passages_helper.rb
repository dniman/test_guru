module TestPassagesHelper
  def result(test_passage)
    if test_passage.success?
      t(".test_completed", correct_questions: test_passage.correct_questions)
    else
      t(".test_failed", correct_questions: test_passage.correct_questions)
    end
  end

  def show_time(test_passage)
    if test_passage.end_time > test_passage.start_time
      "Оставшееся время: #{(test_passage.end_time - test_passage.start_time.seconds_since_midnight).strftime("%T")}"
    else
      ""
    end
  end
end
