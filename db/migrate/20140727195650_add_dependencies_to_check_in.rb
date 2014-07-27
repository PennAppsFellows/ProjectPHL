class AddDependenciesToCheckIn < ActiveRecord::Migration
  def change
  	change_table :check_ins do |t|
  		t.belongs_to :user
  		t.belongs_to :event
    end
  end
end
