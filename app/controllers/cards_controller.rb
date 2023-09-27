class CardsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  skip_before_action :verify_authenticity_token

  def index
  end

  def new
  end

  def create
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] 
    customer = Payjp::Customer.create(
      description: 'test', 
      card: params[:token_id] 
    )

    card = Card.new(
      customer_id: customer.id,
      token_id: params[:token_id],
      user_id: current_user.id
    )

    if card.save
      redirect_to cards_path
    else
      redirect_to new_card_path
    end 
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def set_card
    @card = Creds.where(user_id: current_user.id).first if Creds.where(user_id: current_user.id).present?
  end
end

