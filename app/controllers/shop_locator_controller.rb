class ShopLocatorController < ApplicationController
  def show
    @shops = User.where(user_type: "shop")
    # @shops = shops.near('Bruxelles', 10)

  end
end
