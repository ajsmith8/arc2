class CategoryRelationshipsController < ApplicationController
  def create
    if !current_user.nil?
      @dur = params[:category_relationship][:category_ids]
      temp = CategoryRelationship.where(user_id: current_user.id)
      temp.destroy_all if !temp.empty?
      @dur.each do |i|
        if !i.empty?
          CategoryRelationship.create(user_id: current_user.id, category_id: i)
        end
      end
      redirect_to topic_choice_path
    else 
      @dur = params[:category_relationship][:category_ids]
      topic_id = params[:category_relationship][:t_id]
      @topic = T.find_by_id(topic_id)
      temp = CategoryRelationship.where(t_id: topic_id)
      temp.destroy_all if !temp.empty?
      @dur.each do |i|
        if !i.empty?
          CategoryRelationship.create(t_id: topic_id, category_id: i)
        end
      end
      redirect_to edit_t_path(@topic)
    end
  end
end
