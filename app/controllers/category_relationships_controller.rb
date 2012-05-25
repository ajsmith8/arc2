class CategoryRelationshipsController < ApplicationController
  def create
    @dur = params[:category_relationship][:category_ids]
    temp = CategoryRelationship.where(user_id: current_user.id)
    temp.destroy if !temp.empty?
    
    @dur.each do |i|
      if !i.empty?
        CategoryRelationship.create(user_id: current_user.id, category_id: i)
      end
    end
    
    redirect_to topic_choice_path
      
  end
end
