class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @category_relationship = CategoryRelationship.new
    @user = current_user
    
    foo = CategoryRelationship.where(user_id: @user.id)
    @ids = Array.new
    foo.each do |i|
      @ids.push i.category_id
    end
    
  end
  
end
