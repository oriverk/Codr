# frozen_string_literal: true

# admin
User.create(name: 'oriverk', email: 'oriveryk@gmail.com', password: 'riverfield',profile:"同情するなら金を(　ﾟдﾟ)ｸﾚ", admin: true)
Post.create(name: 'ruby rails omniauth twitter redcarpet rouge js awss3', date: Time.now,
  content: "# Let's Write and Share your Code on Twitter!\nI made this as my portforlio. Plz access footer links.\n## What for\nCode shared on twitter looks not good.(e.g. Some codes turn to link)\n## How\n1. U can Post with markdown format\n2. Push tweet, then the post will be saved onto AWS S3 as image\n\nImage is used only as og:image for twitter card.\n\n```\n<h1>From Now<h2>\n<div>\n  <p>Need to implement syntax-highlight function<p>\n  <p>And to implement more functions</p>\n</div>\n```")

# create general account and posts
# (1..5).each do |i|
#   nm = (1..4).map { ('あ'..'ん').to_a[rand(20)] }.join
#   em = ('a'..'z').to_a.shuffle[1..4].join
#   User.create!(name: nm.to_s, email: "#{em}#{i}@gmail.com", password: SecureRandom.base64)

#   (1..3).each do |_s|
#     postNm = (1..5).map { ('あ'..'ん').to_a[rand(20)] }.join
#     postEm = ('A'..'Z').to_a.shuffle[1..8].join
#     Post.create!(user_id: i + 1, name: postNm.to_s, content: postEm.to_s, date: Time.now)
#   end
# end
