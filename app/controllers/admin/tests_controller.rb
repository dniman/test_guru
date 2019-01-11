module Admin

  class TestsController < BaseController 

    before_action :set_test, only: %i[show edit update destroy] 

    def index
      @tests = Test.all
    end

    def show
    end

    def new
      @test = Test.new
    end

    def edit
    end

    def create
      @test = Test.new(test_params)
      @test.author_id = current_user.id

      if @test.save
        redirect_to @test
      else
        render :new
      end
    end

    def update
      if @test.update(test_params)
        redirect_to @test
      else
        render :edit
      end
    end

    def destroy
      @test.destroy
      redirect_to tests_path
    end

    private
    def set_test
      @test = Test.find(params[:id])
    end

    def test_params
      params.require(:test).permit(:category_id, :title, :level)
    end

  end
end  
