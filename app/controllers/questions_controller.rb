class QuestionsController < ApplicationController
  def index
    @test = Test.find(params[:test_id]) 
    msg = ["#{@test.title}:"]
    @test.questions.each do |q| 
      msg << "  #{q.body}" 
    end

    render plain: msg.join("\n")  
  end
end
