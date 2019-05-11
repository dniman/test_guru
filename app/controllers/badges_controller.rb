class BadgesController < ApplicationController

  before_action :authenticate_user!

  def index
    @badges = Badge.all
    @user_badges = current_user.user_badges
  end
end
