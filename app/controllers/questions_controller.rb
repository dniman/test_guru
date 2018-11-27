class QuestionsController < ApplicationController
  def index
    msg = ["#{@test.title}:"]
    test.questions.each do |q| 
      msg << "  #{q.body}" 
    end

    render plain: msg.join("\n")  
  end

  def show 
    question = Question.find(params[:id])
    msg = [] 
    msg << "id - #{question.id}"
    msg << "body - #{question.body}" 
         
    render plain: msg.join("\n") 
  end

  private
  def test
    Test.find(params[:test_id])
  end
end
