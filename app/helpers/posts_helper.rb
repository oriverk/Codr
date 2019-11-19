# frozen_string_literal: true

module PostsHelper
  require 'twitter'
  def tweetClientHelper
    @client.update("tweet test by posts_helper_method")
  end 
end
