class PagesController < ApplicationController
  def political_choice
    
  end
  
  def home
    @slider = Reason.new
  end
  
  def liberal
    current_user.political_view = "L"
    current_user.save
    redirect_to categories_path
  end
  
  def conservative
    current_user.political_view = "C"
    current_user.save
    redirect_to categories_path
  end
  
  def independent
    current_user.political_view = "I"
    current_user.save
    redirect_to categories_path
  end
  
  def topic_choice
    activityarray = TempActivity.where(user_id: current_user.id).first
    balls = CategoryRelationship.where(user_id: current_user.id) 
    if balls.empty?
      redirect_to categories_path
    end
    @topicchoices = Array.new
    x = 1
    balls.each do |i|
      topicarray=CategoryRelationship.where(user_id: nil, category_id: i.category_id)
      topicarray.each do |j|
        if j.t_id != activityarray.t1_id
          @topicchoices.push T.find_by_id(j.t_id)
          x += 1
        end
        break if x > 5
      end
      break if x > 5
    end
  end
  
  def survey1
    temp = TempActivity.where(user_id: current_user.id).first
    if temp.nil?
      redirect_to root_url
    end
    @friend_question1 = temp   
  end
  
  def feedback1
    temp = TempActivity.where(user_id: current_user.id).first
    if temp.nil?
      redirect_to root_url
    end
    @why_fail1 = temp
  end
  
  def feedback2
    temp = TempActivity.where(user_id: current_user.id).first
    if temp.nil?
      redirect_to root_url
    end
    @why_fail2 = temp
  end
  
  def survey2
    temp = TempActivity.where(user_id: current_user.id).first
    if temp.nil?
      redirect_to root_url
    end
    @friend_question2 = temp
  end
  
  def survey3
    temp = TempActivity.where(user_id: current_user.id).first
    if temp.nil?
      redirect_to root_url
    end
    @friend_question3 = temp
  end
  
  def survey4
    temp = TempActivity.where(user_id: current_user.id).first
    if temp.nil?
      redirect_to root_url
    end
    @friend_question4 = temp
  end
  
  def emailus
    @user = User.find_by_id(current_user.id)
  end
  
  def thanks
  end
end
