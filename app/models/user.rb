class User < ActiveRecord::Base
  has_many :temp_activities, dependent: :destroy
  
  attr_accessible :name, :email, :provider, :uid, :political_view
  
  def self.create
    @user = User.new
    @user.save
  end
end
