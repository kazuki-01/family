class CardsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def set_card
    @card = Creditcard.where(user_id: current_user.id).first if Creditcard.where(user_id: current_user.id).present?
  end
end

