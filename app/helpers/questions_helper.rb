module QuestionsHelper
  def question_header(test, question)
    if question.nil?
      "Create New #{test.title} Question"
    else
      "Edit #{test.title} Question"
    end
  end

end
