class RemoveIndexToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_index :users, [:provider, :uid]
  end
end
