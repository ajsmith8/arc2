class TempActivitiesController < ApplicationController
  def update
      temp = TempActivity.find_by_id(params[:id])
      temp.update_attributes(params[:temp_activity])
      if !params[:temp_activity][:friend_question1].nil?
        redirect_to tutorial1_t_path(T.find_by_id(temp.t1_id))
      else
        if !params[:temp_activity][:friend_question2].nil?
          redirect_to topic_choice_path
        else
          @topic = T.find_by_id(temp.t2_id)
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

          if !params[:temp_activity][:why_fail2].nil?
            redirect_to emailus_path
          elsif !params[:temp_activity][:quiz1].nil?
            redirect_to showquestion_reason_path(@reason2)
          elsif !params[:temp_activity][:quiz2].nil?
            redirect_to showquestion_reason_path(@reason3)
          elsif !params[:temp_activity][:quiz3].nil?
            redirect_to showquestion_reason_path(@reason4)
          elsif !params[:temp_activity][:quiz4].nil?
            redirect_to emailus_path
          else
            redirect_to showquestion_reason_path(@reason1)
          end
        end   
      end
    end

    def create
      @hash = params[:temp_activity]
      redirect_to root_url
    end
  end