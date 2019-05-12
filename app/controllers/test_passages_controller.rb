class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist update_start_time] 
  
  def show
  end

  def result
  end

  def update
    @test_passage.accept!(test_passage_params[:answer_ids])
    if @test_passage.completed?
      AssignBadgeHandler.call(@test_passage.test, @test_passage.user)
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    flash_options = {}
    result = GistQuestionService.new(@test_passage.current_question).call
    
    if result.success?
      flash_options[:notice] = t('.success', url: result.url) 
     
      @user_gist = current_user.gists.create!(question: @test_passage.current_question, gist_url: result.url)
    else
      flash_options[:alert] = t('.failure') 
    end

    redirect_to @test_passage, flash_options
  end


  def update_start_time
    #byebug
    #@test_passage.update(start_time: Time.at(test_passage_params[:start_time].to_f / 1000.0))
    #@test_passage.update_columns(start_time: Time.at(test_passage_params[:start_time].to_f / 1000.0))
    @test_passage.update_columns(start_time: Time.parse(test_passage_params[:start_time]).getlocal)
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def test_passage_params
    params.permit(:start_time, answer_ids: [])
  end
end
