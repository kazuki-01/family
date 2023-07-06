class DonesController < ApplicationController

  def new
    @done = Done.new
    @post = Post.find(params[:id])
  end

  def create
    done = Done.new(task: params[:task], labor: params[:labor], classification: params[:classification])
    done.user_id = current_user.id
    done.save
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path


  end

  private
  def done_params
    params.require(:done).permit(:task, :labor, :classification)
  end

end