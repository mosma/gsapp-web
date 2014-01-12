class CategoryController < ApplicationController
  def index
    @category = Category.root
    render inline: {info: @category, children: @category.children}.to_json
  end

  def show
    @category = Category.find(params[:id])
    render inline: {info: @category, children: @category.children}.to_json
  end
end
