# frozen_string_literal: true

# The default landing page controller

class WelcomePageController < ApplicationController
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  def welcome; end
end
