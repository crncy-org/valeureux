class LandingController < ApplicationController
  skip_before_filter :authenticate_user!

  def landing
    render layout: false
  end

  def signup
    render layout: false
  end
end
