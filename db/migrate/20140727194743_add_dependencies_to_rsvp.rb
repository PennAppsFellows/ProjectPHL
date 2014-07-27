class AddDependenciesToRsvp < ActiveRecord::Migration
  def change
  	change_table :rsvps do |t|
  		t.integer :user_id
  		t.integer :event_id
    end
  end
end
