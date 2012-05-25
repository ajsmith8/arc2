class TempActivitiesController < ApplicationController
  def update
    temp = TempActivity.find_by_id(params[:id])
    temp.update_attributes(params[:temp_activity])
    if !params[:temp_activity][:friend_question1].nil?
      redirect_to tutorial1_t_path(T.find_by_id(temp.t1_id))
    end
    if !params[:temp_activity][:friend_question2].nil?
      if temp.friend_question1.to_i <= temp.friend_question2.to_i
        redirect_to feedback1_path
      else
        redirect_to topic_choice_path
      end
    end
    if !params[:temp_activity][:friend_question3].nil?
      @topic = T.find_by_id(temp.t2_id)
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
      redirect_to showquestion_reason_path(@reason1)
    end
    if !params[:temp_activity][:friend_question4].nil?
      if temp.friend_question3.to_i <= temp.friend_question4.to_i
        redirect_to feedback2_path
      else
        redirect_to emailus_path
      end
    end
    if !params[:temp_activity][:why_fail1].nil?
      redirect_to topic_choice_path
    end
    if !params[:temp_activity][:why_fail2].nil?
      redirect_to emailus_path
    end
    if !params[:temp_activity][:quiz1].nil?
        @topic = T.find_by_id(temp.t2_id)
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
        redirect_to showquestion_reason_path(@reason2)
    end
    if !params[:temp_activity][:quiz2].nil?
      @topic = T.find_by_id(temp.t2_id)
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
      redirect_to showquestion_reason_path(@reason3)
    end
    if !params[:temp_activity][:quiz3].nil?
      @topic = T.find_by_id(temp.t2_id)
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
      redirect_to showquestion_reason_path(@reason4)
    end
    if !params[:temp_activity][:quiz4].nil?
      redirect_to survey4_path
    end
  end
  
  def create
    @hash = params[:temp_activity]
    redirect_to root_url
  end
end