class GoodThingsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create, :show]

  def index
    @good_things = GoodThing.where(user: current_user.id)
    @good_thing = GoodThing.new
  end

  def new
  end

  def create
    @good_thing = GoodThing.new(good_thing_params)

    if @good_thing.save
      redirect_to good_things_index_path
    else
      render :index
    end
  end

  def show
    @good_thing = GoodThing.find(params[:id])
  end

  def destroy
    @good_thing = GoodThing.find(params[:id])
    if @good_thing.destroy
      redirect_to good_things_index_path
    else
      render :show
    end
  end

  private

  def good_thing_params
    params.require(:good_thing).permit(:good_1, :good_2, :good_3, :start_date).merge(user_id: current_user.id)
  end
end
