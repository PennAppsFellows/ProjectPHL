class EventsController < ApplicationController

	before_action :authenticate_user!
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
		@rsvp = Rsvp.new(user_id: @user.id, event_id: @event.id)
		if Rsvp.find_by(user_id: @user.id, event_id: @event.id)
			flash[:notice] = "You already RSVP'd."
			redirect_to @event
		elsif @rsvp.save
			flash[:success] = "RSVP'd!"
			redirect_to @event
		end
	end

	def check_in
		@user = current_user
		@event = Event.find(params[:id])
		@check_in = CheckIn.new(user_id: @user.id, event_id: @event.id)
		if CheckIn.find_by(user_id: @user.id, event_id: @event.id)
			flash[:notice] = "You already checked in."
			redirect_to @event
		elsif @check_in.save
			flash[:success] = "Checked in!"
			redirect_to @event
		end
	end
	
	private 

		def event_params
			params.require(:event).permit(:type_of, :details, :start_at, :location)
		end

end
