class TestsController < ApplicationController

  before_action :authenticate_user!, except: :index
  before_action :set_test, only: %i[start] 

  def index
    @tests = Test.all
  end

  private
  def set_test
    @test = Test.find(params[:id])
  end

end
