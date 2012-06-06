class Category < ActiveRecord::Base
  has_many :ts
  has_many :category_relationships, dependent: :destroy
  
  attr_accessible :name
end
