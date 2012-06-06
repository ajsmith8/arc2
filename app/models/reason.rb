class Reason < ActiveRecord::Base
  belongs_to :t
  
  attr_accessible :title, :description, :correct_answer, :wrong_answer1, :wrong_answer2, :wrong_answer3, 
    :is_pro, :question, :t_id, :score
    #don't mass assign score
end
