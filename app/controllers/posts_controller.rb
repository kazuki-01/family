class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
    @dones = Done.all.order(created_at: :desc)
    @chats = Chat.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  # 空のpostインスタンスを生成する
  end

  def create
    post = Post.new(post_params)
    wday = Weekly.new(weekly_params)
    if post.classification == "generally"
       post.save
      redirect_to posts_path
    else
      if wday.classification == "generally"
      elsif wday.classification == "week"
        wday.save
        redirect_to posts_path
      elsif wday.classification == "date"
        wday.save
        redirect_to posts_path
      elsif wday.classification == "everyday"
        wday.monday = true
        wday.tuesday = true
        wday. wednesday = true
        wday.thursday = true
        wday.friday = true
        wday.saturday = true
        wday.sunday = true
        wday.save
        redirect_to posts_path
      else
        Rails.logger.debug('aaaaa')
      end
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_path

  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:task, :emphasis, :labor, :classification)
  end

  def weekly_params
    params.require(:post).permit(:task, :emphasis, :labor, :classification, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday, :date)
  end

end
