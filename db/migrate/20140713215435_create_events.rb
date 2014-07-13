class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :location
      t.datetime :starts_at
      t.string :details
      t.string :type_of

      t.timestamps
    end
  end
end
