class Admin::DashboardController < Admin::BaseController 

  def show
    @all_products = Product.all.count
    @all_categories = Category.all.count
  end

end
