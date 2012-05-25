class TempActivity < ActiveRecord::Base
  belongs_to :user
  
  def self.sort_reasons(topic_id, user_id)
    @topic = T.find_by_id(topic_id)
      pros = Reason.where(t_id: @topic.id, is_pro: true)
      cons = Reason.where(t_id: @topic.id, is_pro: false)
      pros.sort! { |b,a| a.score <=> b.score }
      cons.sort! { |b,a| a.score <=> b.score }
      if @topic.political == User.find_by_id(user_id).political_view
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
  end
end
