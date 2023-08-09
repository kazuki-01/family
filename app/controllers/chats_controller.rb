class ChatsController < ApplicationController
  before_action :authenticate

def new
  @chat = Chat.new
  @done = Done.find_by(id: params[:format])
  @thanks = Thank.all.order(created_at: :asc)
end

def create
  chat = Chat.new(chat_params)
  chat.user_id = current_user.id
  chat.save
  redirect_to posts_path
end

def edit
  @chat = Chat.find(params[:id])
  @thanks = Thank.all.order(created_at: :asc)
end

def update
  @chat = Chat.find(params[:id])
  @chat.update(chat_params)
  @chat.save
  redirect_to posts_path
end

def destroy
end

private
def chat_params
  params.require(:chat).permit(:user_id, :done_id, :message)
end

end
