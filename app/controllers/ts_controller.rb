class TsController < ApplicationController
  def index
    @title = "All Topics"
    @topics = T.all
    @topics.sort! { |b,a| a.score <=> b.score}
  end
  
  def new
    @topic = T.new
  end
  
  def edit
    @category_relationship = CategoryRelationship.new
    @topic = T.find_by_url(params[:id])
    foo = CategoryRelationship.where(t_id: @topic.id)
    @ids = Array.new
    foo.each do |i|
      @ids.push i.category_id
    end
  end
  
  def update
    @topic = T.find_by_url(params[:id])
    @topic.update_attributes(params[:t])
    redirect_to root_url
  end
  
  def create
    @topic = T.new(params[:t])
    @topic.score = 0
    @topic.save

    redirect_to @topic
  end
  
  def show
    @topic = T.find_by_url(params[:id])
    reasons = Reason.where(t_id: @topic.id)
    reasons.sort! { |b,a| a.created_at <=> b.created_at}
    @reason = reasons.first
    
    @pros = Reason.where(t_id: @topic.id, is_pro: true)
    @cons = Reason.where(t_id: @topic.id, is_pro: false)
    
    unless @pros.empty?
      @pros.sort! { |b,a| a.score <=> b.score}
    end
    
    unless @cons.empty? 
      @cons.sort! { |b,a| a.score <=> b.score}
    end
    
    @newpro = Reason.new
    @newcon = Reason.new
  end
  
  def description
    @topic = T.find_by_url(params[:id])
  end
  
  def choose
    @topic = T.find_by_url(params[:id])
    activityarray = TempActivity.where(user_id: current_user.id).first
    if activityarray.t1_id.nil?
      activityarray.t1_id = @topic.id
      activityarray.save
      redirect_to tutorial1_t_path(@topic)
    else 
      activityarray.t2_id = @topic.id
      activityarray.save
      @topic = T.find_by_id(activityarray.t2_id)
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
      redirect_to showquestion_reason_path(@reason1)
    end
  end
  
  def tutorial1
    @topic = T.find_by_url(params[:id])
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
  end
  
  def votepros
     @topic = T.find_by_url(params[:id])
     @pros = Reason.where(t_id: @topic.id, is_pro: true)

     unless @pros.empty?
       @pros.sort! { |b,a| a.score <=> b.score} 
     end
   end

   def votecons
     @topic = T.find_by_url(params[:id])
     @cons = Reason.where(t_id: @topic.id, is_pro: false)

     unless @cons.empty?
       @cons.sort! { |b,a| a.score <=> b.score}
     end
   end
   
   def update
     @topic = T.find_by_url(params[:id])
     @topic.update_attributes(params[:t])
     redirect_to @topic
   end
   
   def description
     @topic = T.find_by_url(params[:id])
   end
   
   def destroy
     topic = T.find_by_url(params[:id])
     topic.destroy
     redirect_to ts_path
   end
   
   def topicdescription
     @topic = T.find_by_url(params[:id])
     activity = TempActivity.where(user_id: current_user.id).last
     if activity.t1_id == nil
       @partB = false
     else
       @partB = true
     end
   end
end
