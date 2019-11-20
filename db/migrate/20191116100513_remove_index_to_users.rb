# frozen_string_literal: true

class RemoveIndexToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_index :users, %i[provider uid]
  end
end
