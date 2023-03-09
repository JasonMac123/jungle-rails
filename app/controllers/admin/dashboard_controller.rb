class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["ADMIN_USER"], password: ENV["ADMIN_PASSWORD"]
  
  def show
    @products = Category.count("id")
    @categories = Product.select("DISTINCT category_id")
    @number_of_orders = LineItem.select("DISTINCT order_id")
  end
end
