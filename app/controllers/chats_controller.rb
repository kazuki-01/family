class ChatsController < ApplicationController

def new
  @chat = Chat.new
  @done = Done.find_by(id: params[:format])
end

def create
  chat = Chat.new(chat_params)
  chat.user_id = current_user.id
  chat.save
  redirect_to posts_path
end

def edit
end

def update
end

def destroy
end

private
def chat_params
  params.require(:chat).permit(:user_id, :done_id, :message)
end

end
