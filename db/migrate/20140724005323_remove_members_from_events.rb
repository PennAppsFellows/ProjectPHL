class RemoveMembersFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :members, :string
  end
end
