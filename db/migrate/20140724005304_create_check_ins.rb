class CreateCheckIns < ActiveRecord::Migration
  def change
    create_table :check_ins do |t|

      t.timestamps
    end
  end
end
