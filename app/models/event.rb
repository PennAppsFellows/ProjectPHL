class Event < ActiveRecord::Base
	attr_accessor :members

	has_many :rsvps, :dependent  => :destroy
  has_many :check_ins, :dependent  => :destroy


	def my_date_field 
		starts_at.strftime("%d/%m/%Y")
	end

end
