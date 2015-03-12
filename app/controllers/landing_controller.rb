class LandingController < ApplicationController
  skip_before_filter :authenticate_user!

  def landing
    render layout: false
  end

  def landing2
    if current_user
      redirect_to '/home/index'
    else
      render layout: false
    end
  end

  def signup
    render layout: false
  end
end
