# frozen_string_literal: true


  class Users::RegistrationsController < Devise::RegistrationsController
    before_action :configure_permitted_parameters, only: [:create]
    before_action :fobid_login_user, {only: [:new, :check, :create]}
  
    # GET /users/sign_up

    def index
      @group = Group.find(current_user.group_id)
      @users = User.where(group_id: current_user.group_id).order(created_at: :asc)
    end

    def new
      super
    end

    
    def check
      @user = User.new(user_icon: params[:user_icon], name: params[:name], email: params[:email], password: params[:password],password_confirmation: params[:password_confirmation])
      logger.debug "新しい記事: #{@user.attributes.inspect}"
      if @user.invalid?
        render :new
      end
    end
  
    # POST /users
    def create
      group = Group.new(group_params)
      group.save
      Rails.logger.debug('aaaaa')
      super
      Rails.logger.debug('bbbbb')
      @user.group_id = group.id
      @user.save
    end
  
    # GET /users/edit
    def edit
      super

    end
  
    # PUT /users
    def update
      if current_user.update(update_params)
        redirect_to posts_path(current_user)
      else
        render :edit
      end
  
    end
  
    # DELETE /users
    def destroy
      super
    end

    def cancel
      super
    end


    private

    def user_params
      params.require(:user).permit(:user_icon, :name, :email, :password, :password_confirmation, group_id)
    end

    def group_params
      params.require(:user).permit(:group_name, :paid)
    end

    protected

    def after_update_path_for(resource)
      # 自分で設定した「マイページ」へのパス
      posts_path(current_user)
    end

    def after_sign_up_path_for(resource)
      posts_path(resource)
    end

    def update_params
      params.require(:user).permit(:user_icon, :name)
    end

  end
