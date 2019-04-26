class Admin::BadgesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_badge, only: %i[show edit update destroy]

  def index
    @badges = Badge.all
  end
  
  def show
  end

  def edit
  end
       
  def new
    @badge = Badge.new
  end
  
  def create
    @badge = Badge.new(badge_params)
    
    if @badge.save
      redirect_to [:admin, @badge]
    else
      render :new
    end
  end

  def update
    if @badge.update(badge_params)
      redirect_to [:admin, @badge]
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to [:admin, @badge]
  end

  private
  
    def set_badge
      @badge = Badge.find(params[:id])
    end

    def badge_params
      params.require(:badge).permit(:name, :file_name, :rule_id)
    end
end
