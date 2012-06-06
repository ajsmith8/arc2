class ReasonsController < ApplicationController
  def show
    @reason = Reason.find_by_id(params[:id])
    @topic = T.find_by_id(@reason.t_id)
  end
  
  def showquestion
    @activity = TempActivity.where(user_id: current_user.id).first
    @reason = Reason.find_by_id(params[:id])
    @hash = params
    @topic = T.find_by_id(@reason.t_id)
      pros = Reason.where(t_id: @topic.id, is_pro: true)
      cons = Reason.where(t_id: @topic.id, is_pro: false)
      pros.sort! { |b,a| a.score <=> b.score }
      cons.sort! { |b,a| a.score <=> b.score }
      if @topic.majority == "pro"
        @reason1 = cons[0]
        @reason2 = pros[0]
        @reason3 = cons[1]
        @reason4 = pros[1]
      else
        @reason1 = pros[0]
        @reason2 = cons[0]
        @reason3 = pros[1]
        @reason4 = cons[1]
      end
    array = [@reason1, @reason2, @reason3, @reason4]
    @counter = 1
    array.each do |i|
      if i == @reason
        break
      end
      @counter += 1
    end
    
    @reason = Reason.find_by_id(params[:id])
    @numquestions = Reason.where(t_id: @reason.t_id).count
    @questionnumber = 1
    @topic = T.find_by_id(@reason.t_id)
    @correctindex = rand(4)
    
    wins = [
     [ 1, 63, 72 ],
     [ 2, 63, 69 ],
     [ 3, 65, 65 ],
     [ 4, 63, 86 ],
     [ 5, 81, 45 ],
     [ 6, 68, 79 ],
     [ 7, 63, 61 ],
     [ 8, 67, 86 ],
     [ 9, 58, 58 ],
     [ 10, 85, 77 ],
     [ 11, 63, 83 ],
     [ 12, 59, 59 ],
     [ 13, 74, 59 ],
     [ 14, 58, 58 ],
     [ 15, 70, 70 ],
     [ 16, 76, 56 ],
     [ 17, 76, 63 ]]
    
    fails = [
     [ 1, 68, 79 ],
     [ 2, 67, 59 ],
     [ 3, 63, 83 ],
     [ 4, 63, 90 ],
     [ 5, 60, 60 ],
     [ 6, 70, 68 ],
     [ 7, 68, 63 ],
     [ 8, 65, 52 ],
     [ 9, 59, 69 ],
     [ 10, 61, 61 ],
     [ 11, 72, 83 ],
     [ 12, 68, 59 ],
     [ 13, 65, 77 ],
     [ 14, 63, 63 ],
     [ 15, 61, 61 ],
     [ 16, 65, 65 ],
     [ 17, 58, 58 ],
     [ 18, 56, 56 ],
     [ 19, 56, 56 ],
     [ 20, 63, 63 ],
     [ 21, 58, 58 ],
     [ 22, 65, 65 ],
     [ 23, 58, 58 ],
     [ 24, 61, 81 ]]
    
    winvar = 1 + rand(17)
    failvar = 1 + rand(24)
    @winpath = "/assets/win" + winvar.to_s() + ".png"
    @winheight = wins[winvar-1][1]
    @winwidth = wins[winvar-1][2]
    
    @failpath = "/assets/fail" + failvar.to_s() + ".png"
    @failheight = fails[failvar-1][1]
    @failwidth = fails[failvar-1][2]
  end
  
  def create
    reason = Reason.new(params[:reason])
    reason.score = 0
    reason.save
    redirect_to T.find_by_id(reason.t_id)
  end
  
  def upvote
    reason = Reason.find_by_id(params[:id])
    reason.score = reason.score + 1
    reason.save
    redirect_to reason_path(reason)
  end
  
  def downvote
    reason = Reason.find_by_id(params[:id])
    reason.score = reason.score - 1
    reason.save
    redirect_to reason_path(reason)
  end
  
  def edit
    @reason = Reason.find_by_id(params[:id])
    @topic = T.find_by_id(@reason.t_id)
  end
  
  def update
    @reason = Reason.find_by_id(params[:id])
    @reason.update_attributes(params[:reason])
    @topic = T.find_by_id(@reason.t_id)
    redirect_to @topic
  end
  
  def correctanswer
    @reason = Reason.find_by_id(params[:id])
    @topic = T.find_by_id(@reason.t_id)
      pros = Reason.where(t_id: @topic.id, is_pro: true)
      cons = Reason.where(t_id: @topic.id, is_pro: false)
      pros.sort! { |b,a| a.score <=> b.score }
      cons.sort! { |b,a| a.score <=> b.score }
      if @topic.majority == "pro"
        @reason1 = cons[0]
        @reason2 = pros[0]
        @reason3 = cons[1]
        @reason4 = pros[1]
      else
        @reason1 = pros[0]
        @reason2 = cons[0]
        @reason3 = pros[1]
        @reason4 = cons[1]
      end
    array = [@reason1, @reason2, @reason3, @reason4]
    @counter = 1
    array.each do |i|
      if i == @reason
        break
      end
      @counter += 1
    end
    
    if @counter == 1
      @newreason = @reason2
    elsif @counter == 2
      @newreason = @reason3
    elsif @counter == 3
      @newreason = @reason4
    end
    
    activity = TempActivity.where(user_id: current_user.id).first
    if @counter == 1
      activity.quiz1 = true
      activity.save
    elsif @counter == 2
      activity.quiz2 = true
      activity.save
    elsif @counter == 3
      activity.quiz3 = true
      activity.save
    else
      activity.quiz4 = true
      activity.save
    end
    
     wins = [
       [ 1, 63, 72 ],
       [ 2, 63, 69 ],
       [ 3, 65, 65 ],
       [ 4, 63, 86 ],
       [ 5, 81, 45 ],
       [ 6, 68, 79 ],
       [ 7, 63, 61 ],
       [ 8, 67, 86 ],
       [ 9, 58, 58 ],
       [ 10, 85, 77 ],
       [ 11, 63, 83 ],
       [ 12, 59, 59 ],
       [ 13, 74, 59 ],
       [ 14, 58, 58 ],
       [ 15, 70, 70 ],
       [ 16, 76, 56 ],
       [ 17, 76, 63 ]]

      fails = [
       [ 1, 68, 79 ],
       [ 2, 67, 59 ],
       [ 3, 63, 83 ],
       [ 4, 63, 90 ],
       [ 5, 60, 60 ],
       [ 6, 70, 68 ],
       [ 7, 68, 63 ],
       [ 8, 65, 52 ],
       [ 9, 59, 69 ],
       [ 10, 61, 61 ],
       [ 11, 72, 83 ],
       [ 12, 68, 59 ],
       [ 13, 65, 77 ],
       [ 14, 63, 63 ],
       [ 15, 61, 61 ],
       [ 16, 65, 65 ],
       [ 17, 58, 58 ],
       [ 18, 56, 56 ],
       [ 19, 56, 56 ],
       [ 20, 63, 63 ],
       [ 21, 58, 58 ],
       [ 22, 65, 65 ],
       [ 23, 58, 58 ],
       [ 24, 61, 81 ]]

      winvar = 1 + rand(17)
      failvar = 1 + rand(24)
      @winpath = "/assets/win" + winvar.to_s() + ".png"
      @winheight = wins[winvar-1][1]
      @winwidth = wins[winvar-1][2]

      @failpath = "/assets/fail" + failvar.to_s() + ".png"
      @failheight = fails[failvar-1][1]
      @failwidth = fails[failvar-1][2] 
  end
  
  def incorrectanswer
    @reason = Reason.find_by_id(params[:id])
    @topic = T.find_by_id(@reason.t_id)
      pros = Reason.where(t_id: @topic.id, is_pro: true)
      cons = Reason.where(t_id: @topic.id, is_pro: false)
      pros.sort! { |b,a| a.score <=> b.score }
      cons.sort! { |b,a| a.score <=> b.score }
      if @topic.majority == "pro"
        @reason1 = cons[0]
        @reason2 = pros[0]
        @reason3 = cons[1]
        @reason4 = pros[1]
      else
        @reason1 = pros[0]
        @reason2 = cons[0]
        @reason3 = pros[1]
        @reason4 = cons[1]
      end
    array = [@reason1, @reason2, @reason3, @reason4]
    @counter = 1
    array.each do |i|
      if i == @reason
        break
      end
      @counter += 1
    end
    
    if @counter == 1
      @newreason = @reason2
    elsif @counter == 2
      @newreason = @reason3
    elsif @counter == 3
      @newreason = @reason4
    end
    
    activity = TempActivity.where(user_id: current_user.id).first
    if @counter == 1
      activity.quiz1 = false
      activity.save
    elsif @counter == 2
      activity.quiz2 = false
      activity.save
    elsif @counter == 3
      activity.quiz3 = false
      activity.save
    else
      activity.quiz4 = false
      activity.save
    end
    
     wins = [
       [ 1, 63, 72 ],
       [ 2, 63, 69 ],
       [ 3, 65, 65 ],
       [ 4, 63, 86 ],
       [ 5, 81, 45 ],
       [ 6, 68, 79 ],
       [ 7, 63, 61 ],
       [ 8, 67, 86 ],
       [ 9, 58, 58 ],
       [ 10, 85, 77 ],
       [ 11, 63, 83 ],
       [ 12, 59, 59 ],
       [ 13, 74, 59 ],
       [ 14, 58, 58 ],
       [ 15, 70, 70 ],
       [ 16, 76, 56 ],
       [ 17, 76, 63 ]]

      fails = [
       [ 1, 68, 79 ],
       [ 2, 67, 59 ],
       [ 3, 63, 83 ],
       [ 4, 63, 90 ],
       [ 5, 60, 60 ],
       [ 6, 70, 68 ],
       [ 7, 68, 63 ],
       [ 8, 65, 52 ],
       [ 9, 59, 69 ],
       [ 10, 61, 61 ],
       [ 11, 72, 83 ],
       [ 12, 68, 59 ],
       [ 13, 65, 77 ],
       [ 14, 63, 63 ],
       [ 15, 61, 61 ],
       [ 16, 65, 65 ],
       [ 17, 58, 58 ],
       [ 18, 56, 56 ],
       [ 19, 56, 56 ],
       [ 20, 63, 63 ],
       [ 21, 58, 58 ],
       [ 22, 65, 65 ],
       [ 23, 58, 58 ],
       [ 24, 61, 81 ]]

      winvar = 1 + rand(17)
      failvar = 1 + rand(24)
      @winpath = "/assets/win" + winvar.to_s() + ".png"
      @winheight = wins[winvar-1][1]
      @winwidth = wins[winvar-1][2]

      @failpath = "/assets/fail" + failvar.to_s() + ".png"
      @failheight = fails[failvar-1][1]
      @failwidth = fails[failvar-1][2]
  end
end
