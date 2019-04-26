class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist] 
  
  def show

  end

  def result

  end

  def update
    @test_passage.accept!(test_passage_params[:answer_ids])
    if @test_passage.completed?
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

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def test_passage_params
    params.permit(answer_ids: [])
  end
end
