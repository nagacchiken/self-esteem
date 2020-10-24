class GoodThingsController < ApplicationController
  before_action :authenticate_user!, only: [:index,:create]

  def index
    @good_things = GoodThing.all
 
      @good_thing = GoodThing.find_or_initialize_by(
        start_date:params[:date],user_id:current_user.id)
    
  end

  # def new
  #   @event = GoodThing.new
  #   render plain: render_to_string(partial: 'form_new', layout: false, locals: { good_thing: @good_thing })
  # end

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

# def update
#   @good_thing = GoodThing.find_by(
#     start_date:good_thing_params[:start_date],user_id:current_user.id
#   ).update(good_thing_params)

#   redirect_to good_things_index_path

# end

  private
  
  def good_thing_params
    params.require(:good_thing
    ).permit(:good_1, :good_2, :good_3,:start_date
    ).merge(user_id: current_user.id)
  end

end
