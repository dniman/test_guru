module TestPassagesHelper
  def passed_questions
    @test_passage.correct_questions/@test_passage.test.questions.count * 100
  end
end
