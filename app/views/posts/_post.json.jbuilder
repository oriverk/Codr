# frozen_string_literal: true

json.extract! post, :id, :user_id, :name, :content, :date, :created_at, :updated_at
json.url post_url(post, format: :json)
