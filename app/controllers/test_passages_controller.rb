class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_client, only: %i[gist]
  before_action :set_user_gist, only: %i[gist]
  before_action :set_test_passage, only: %i[show update result gist] 
  
  def show

  end

  def result

  end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question, client: @client).call
    
    flash_options = if result.success?
                      { notice: t('.success', url: result.url) }
                    else
                      { alert: t('.failure') }
                    end
    
    @user_gist.question = @test_passage.current_question
    @user_gist.gist_url = result.url
    @user_gist.save!

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def set_client
    @client = OctokitClient.new
  end

  def set_user_gist
    @user_gist = current_user.gists.new
  end
end
