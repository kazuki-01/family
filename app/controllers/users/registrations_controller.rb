# frozen_string_literal: true


  class Users::RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    # GET /users/sign_up
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
      Rails.logger.debug('aaaaa')
      super
      Rails.logger.debug('bbbbb')
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


    private

    def user_params
      params.require(:user).permit(:user_icon, :name, :email, :password, :password_confirmation)
    end

    protected

    def after_update_path_for(resource)
      # 自分で設定した「マイページ」へのパス
      posts_index_path(current_user)
    end

    def after_sign_up_path_for(resource)
      posts_index_path(resource)
    end

  end
