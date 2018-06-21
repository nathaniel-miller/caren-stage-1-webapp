class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :authorize_user

  def authorize_user
    if params[:controller] == "circles"
      circle_id = params[:id]
    elsif params[:circle_id]
      circle_id = params[:circle_id]
    end
    
    if circle_id && !current_user.positions.find_by(circle_id: circle_id)
      redirect_to root_path
    end
  end
end
