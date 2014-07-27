class AddMembersToEvents < ActiveRecord::Migration
  def change
    add_column :events, :members, :string
  end
end
