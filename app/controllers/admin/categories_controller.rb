class Admin::CategoriesController < ApplicationController

  http_basic_authenticate_with name: ENV['BASIC_AUTH_USERNAME'], password: ENV['BASIC_AUTH_PASSWORD']

  def index
    @categories = Category.joins(:products).select('categories.*, COUNT(categories.name) AS total_products').group(:id).order(id: :desc)
  end

  def new
    @category = Category.new
  end

  def create
  end
end
