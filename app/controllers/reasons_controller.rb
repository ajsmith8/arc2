class ReasonsController < ApplicationController
  def show
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
      if @topic.political == current_user.political_view
        @reason1 = cons[0]
        @reason2 = pros[1]
        @reason3 = pros[0]
        @reason4 = cons[1]
      else
        @reason1 = pros[0]
        @reason2 = cons[1]
        @reason3 = cons[0]
        @reason4 = pros[1]
      end
    array = [@reason1, @reason2, @reason3, @reason4]
    @counter = 1
    array.each do |i|
      if i == @reason
        break
      end
      @counter += 1
    end
  end
  
  def create
    temp = Reason.new(params[:reason])
    @hash = params[:reason]
  end
end
