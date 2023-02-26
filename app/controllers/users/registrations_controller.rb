# frozen_string_literal: true


  class Users::RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_account_update_params, only: [:update]
  
    # GET /users/sign_up
    def new
      super
    end

    def check
      Rails.logger.debug(user_params)
      @user = User.new(user_params)
      puts @user
    end
  
  
    # POST /users
    def create
      @user = User.new(name: params[:name], email: params[:email], password: params[:password])
      Rails.logger.debug("bbbbb")
      Rails.logger.debug(params[:user_icon])
      if @user.save
        session[:user_id] = @user.id
        redirect_to posts_index_path(@user), notice: "新規登録が完了しました。"
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    # GET /users/edit
    def edit
      super

    end
  
    # PUT /users
    def update
      super
    end
  
    # DELETE /users
    def destroy
      super
    end

    def cancel
      super
    end
  
    protected

    def user_params
      params.require(:user).permit(:user_icon, :name, :email, :password, :password_confirmation)
    end
  
    # 許可するための追加のパラメータがある場合は、sanitizer に追加してください
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
  
    # 許可するための追加のパラメータがある場合は、sanitizer に追加してください
    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
    end
  
    # サインアップ後に使用する path
    def after_sign_up_path_for(resource)
      super(resource)
    end
  
    # アクティブでないアカウントのサインアップ後に使用する path
    def after_inactive_sign_up_path_for(resource)
      super(resource)
    end
  end
