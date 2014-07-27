class AddDependenciesToRsvp < ActiveRecord::Migration
  def change
  	change_table :rsvps do |t|
  		t.belongs_to :user
  		t.belongs_to :event
    end
  end
end
