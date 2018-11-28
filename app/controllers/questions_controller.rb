class QuestionsController < ApplicationController

  before_action :find_test, only: :index
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: @test.questions.inspect
  end

  def show 
    render plain: @question.inspect 
  end

  def new 
  end
    
  def create
    question = Question.create(question_params)

    render plain: question.inspect 
  end
          
  def destroy
    render plain: "Question was deleted" 
  end
       
  private
  
  def rescue_with_question_not_found
    render plain: 'Question was not found' 
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end
  
  def question_params
    parameters.permit(:test_id, :body) 
  end

  def parameters
    raw_parameters = { test_id: params[:test_id], body: params[:question][:body] }

    ActionController::Parameters.new(raw_parameters)
  end
end

