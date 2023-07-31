class ThanksController < ApplicationController

  def new
    @thanks = Thank.all.order(created_at: :desc)
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
  end

  private
  def thank_params
    params.require(:thank).permit(:text)
  end

end
