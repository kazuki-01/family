class ChatsController < ApplicationController

def new
  @chat = Chat.new
  @done = Done.find_by(id: params[:format])
end

def create
end

def edit
end

def update
end

def destroy
end

end
