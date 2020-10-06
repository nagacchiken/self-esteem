class GoodThingsController < ApplicationController
  def index
    @good_things = GoodThing.all
    @good_thing = GoodThing.new
  end

  def create
    
    @good_thing = GoodThing.new(good_thing_params)
    
    if @good_thing.save
    redirect_to root_path
    end
  end

  private
  
  def good_thing_params
    params.require(:good_thing).permit(:good_1, :good_2, :good_3,:start_date).merge(user_id: current_user.id)
  end


end
