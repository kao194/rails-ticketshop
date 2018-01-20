class EventsController < ApplicationController
  before_action :set_event, only: [:show]
  before_action :check_logged_in, only: [:new, :create]
  def index
    @events = Event.all
  end

  def new
  	@event = Event.new
  end

  def create

  end
  def create
	event_parameters = params.require(:event).permit(:artist, :description,
	:price_low, :price_high, :event_date)
	@event = Event.new(event_parameters)
	if @event.save
	flash[:komunikat] = 'Event został poprawnie stworzony.'
	redirect_to "/events/#{@event.id}"
	else
	render 'new'
	end
end

  private
   # Use callbacks to share common setup or constraints between actions.
   def check_logged_in
		authenticate_or_request_with_http_basic("Ads") do |username, password|
		username == "admin" && password == "admin"
	end
end
    def set_event
       @event = Event.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:artist, :description, :price_low, :price_high, :event_date)
    end
end
