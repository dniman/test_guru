class TestsController < ApplicationController

  before_action :authenticate_user!, except: :index
  before_action :set_test, only: %i[start] 

  def index
    @tests = Test.available_tests
  end

  def start
    time = Time.parse("00:00:00")
    current_user.test_passages.create(test: @test, start_time: time, end_time: time + @test.test_time.seconds_since_midnight)
    redirect_to current_user.test_passage(@test)
  end

  private
  def set_test
    @test = Test.find(params[:id])
  end

end
