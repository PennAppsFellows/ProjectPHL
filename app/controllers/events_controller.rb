class EventsController < ApplicationController
  def index
  	@all_events = Event.first(10)
  end
  def new
		@event = Event.new
  end

  def show
		@event = Event.find(params[:id])
	end

	def create
		@event = Event.new(event_params)
		if @event.save
			flash[:success] = "Event created!"
			redirect_to @event
		else
			render 'new'
		end
	end

	def rsvp
		@user = current_user
		@event = Event.find(params[:id])
		if @event.save
			flash[:success] = "RSVP'd!"
			redirect_to @event
		end
	end

	def check_in
		@user = current_user
		@event = Event.find(params[:id])
		if @event.save
			flash[:success] = "Checked in!"
			redirect_to @event
		end
	end
	
	private 

		def event_params
			params.require(:event).permit(:type_of, :details, :start_at, :location)
		end

end
