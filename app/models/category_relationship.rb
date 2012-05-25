class CategoryRelationship < ActiveRecord::Base
  belongs_to :category
  belongs_to :t
  
  attr_accessible :t_id, :category_id, :user_id
end
