module QuestionsHelper
  def question_header(question)
    if question.new_record?
      t(".create_new", title: question.test.title)
    else
      t(".edit", title: question.test.title)
    end
  end

end
