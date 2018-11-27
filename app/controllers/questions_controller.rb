class QuestionsController < ApplicationController
  def index
    test = Test.find(params[:test_id])

    render plain: test.questions.inspect
  end

  def show 
    question = Question.find(params[:id])
         
    render plain: question.inspect 
  end

  def new 
  end
    
  def create
    question = Question.create(question_params)

    render plain: question.inspect 
  end

  private

  def question_params
    parameters.permit(:test_id, :body) 
  end

  def parameters
    raw_parameters = { test_id: params[:test_id], body: params[:question][:body] }
    ActionController::Parameters.new(raw_parameters)
  end
end

