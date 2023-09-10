class Users::InvitationsController < Devise::InvitationsController
  def new
    super
  end

  def create
    super
  end

  def edit
    super
  end

  def update
    super
    @user.group_id = User.find(@user.invited_by_id).group_id
    if @user.save
      session[:user_id] = @user.id
    end
  end

  def destroy
    super
  end
end