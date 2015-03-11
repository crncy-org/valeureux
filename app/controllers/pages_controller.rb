class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:login, :login_2, :register, :shop_locator]

  def empty_page
  end

  def login
    render layout: 'landing'
  end

  def lockscreen
  end

  def login_2
    render layout: 'landing'
  end

  def register
    render layout: 'landing'
  end

  def shop_locator
  end

  def not_found_error
  end

  def internal_server_error
  end

  def shop_locator
    @shops = User.where(user_type: "shop")
    # @shops = shops.near('Bruxelles', 10)

  end
end
