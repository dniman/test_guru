class QuestionsController < ApplicationController

  before_action :find_test, only: %i[index new create]
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
    question.save

    if question.persisted?  
      redirect_to question_path(question)
    else
      render plain: "Record not saved" 
    end
  end
          
  def destroy
    if @question.destroy
      redirect_to test_questions_path(@test) 
    else
      render plain: "Question was not deleted" 
    end
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
    params.require(:question).permit(:body).merge!(params.permit(:test_id))  
  end
end

