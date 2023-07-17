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
     redirect_to index_topic_path, notice: '登録しました'
   else
     render :new
   end
 end 

 def edit
    @topic = Topic.find(params[:id])
    
    render :edit
 end

 def update
   @topic = Topic.find(params[:id])
    if params[:topic]
      @topic.attach(params[:topic])
    end
    if @topic.update(topic_params)
      redirect_to index_topic_path, notice: '更新しました'
    else
      render :edit, status: :unprocessable_entity
    end
 end 
 
 # ここから追加
  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to index_topic_path, notice: '削除しました'
  end
  # ここまで

  private

 def set_topic
   @topic=Topic.find(params[:id])
 end 

 def topic_params
  params.require(:topic).permit(:title,:content)
 end 
 
 
 
end 