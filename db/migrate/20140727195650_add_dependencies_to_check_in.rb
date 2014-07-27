class AddDependenciesToCheckIn < ActiveRecord::Migration
  def change
  	change_table :check_ins do |t|
  		t.integer :user_id
  		t.integer :event_id
    end
  end
end
