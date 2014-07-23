class EventsController < ApplicationController
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
	end

	private 

		def event_params
			params.require(:event).permit(:type_of, :details, :start_at, :location)
		end

end
