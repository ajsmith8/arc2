class T < ActiveRecord::Base
  has_many :reasons, dependent: :destroy
  has_many :category_relationships
  
  acts_as_url :title, sync_url: true
  
  attr_accessible :title, :description, :political
  
  def to_param
    url
  end
end
