class TestsController < ApplicationController

  before_action :authenticate_user!, except: :index
  before_action :set_test, only: %i[start] 

  def index
    @tests = Test.available_tests
  end

  def start
    current_user.test_passages.create(test: @test)
    redirect_to current_user.test_passage(@test)
  end

  private
  def set_test
    @test = Test.find(params[:id])
  end

end
