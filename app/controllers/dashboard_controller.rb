class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @circles = @user.circles
    @invitations = Invitation.where("email = ?", @user.email)
  end
end
