class ThanksController < ApplicationController
  before_action :authenticate

  def new
    @thanks = Thank.all.order(created_at: :asc)
  end

  def create
    thank = Thank.new(thank_params)
    thank.save
    redirect_to new_thank_path
  end

  def edit
  end

  def update
  end

  def destroy
    @thank = Thank.find(params[:id])
    @thank.destroy
    redirect_to new_thank_path
  end

  private
  def thank_params
    params.require(:thank).permit(:text)
  end

end
