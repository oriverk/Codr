# frozen_string_literal: true

class AddColumntoPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :image, :binary
  end
end
