class GoodThingsController < ApplicationController
  def index
    @good_things = GoodThing.all
    @good_thing = GoodThing.new
  end

  def create
    
    @good_thing = GoodThing.new(good_thing_params)
    
    if @good_thing.save
    redirect_to good_things_index_path
    else
      render @good_thing
    end
  end

def update
  @good_thing = GoodThing.find_by(
    start_date:good_thing_params[:start_date],user_id:current_user.id
  ).update(good_thing_params)

  redirect_to good_things_index_path

end

  private
  
  def good_thing_params
    params.require(:good_thing
    ).permit(:good_1, :good_2, :good_3,:start_date
    ).merge(user_id: current_user.id)
  end


end
