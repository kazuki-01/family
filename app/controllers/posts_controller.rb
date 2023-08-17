class PostsController < ApplicationController
  before_action :authenticate_user! #deviseでログインしていなかったらログイン画面にリダイレクト

  def index
    @posts = Post.where(group_id: current_user.group_id).order(:id)
    @dones = Done.where(group_id: current_user.group_id).order(:id)
    @chats = Chat.where(group_id: current_user.group_id).order(created_at: :desc)
  end

  def new
    @post = Post.new
  # 空のpostインスタンスを生成する
  end

  def create
    post = Post.new(post_params)
    post.group_id = current_user.group_id
    wday = Weekly.new(weekly_params)
    wday.group_id = current_user.group_id
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
    params.require(:post).permit(:task, :emphasis, :labor, :classification, :group_id)
  end

  def weekly_params
    params.require(:post).permit(:task, :emphasis, :labor, :classification, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday, :date, :group_id)
  end

end
