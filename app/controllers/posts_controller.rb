class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
    @dones = Done.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  # 空のpostインスタンスを生成する
  end

  def create
    post = Post.new(post_params)
  # newページで入力した内容が格納された状態のインスタンスが飛んでくる
    if post.save
      redirect_to posts_path
    else
      render 'new'
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

end
