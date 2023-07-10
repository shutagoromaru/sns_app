class TopicsController < ApplicationController
  before_action :set_topic, only: [:edit, :update]
  
  
  def index
    @title = params[:title]
    if @title.present?
      @topics = Topic.where('title LIKE ?', "%#{@title}%")
    else
      @topics = Topic.all
    end

    render :index
  end
  
  
 def new
   @topic = Topic.new
   render :new
 end

 def create
     @topic = Topic.new(topic_params)
   if @topic.save
    # creat_topic_path　から変更
     redirect_to topic_path(@topic)
   else
     render :new
   end
 end 

 def edit
   render :edit
 end

 def update
  if @topic.update(topic_params)
     redirect_to @topic
  else
     render :edit
  end
 end 

  private

 def set_topic
   @topic=Topic.find(params[:id])
 end 

 def topic_params
  params.require(:topic).permit(:title,:content)
 end 
 
 
 
end 