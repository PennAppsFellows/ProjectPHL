class Event < ActiveRecord::Base
	attr_accessor :members

	def my_date_field 
		starts_at.strftime("%d/%m/%Y")
	end

end
