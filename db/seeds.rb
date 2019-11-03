# admin
User.create(name:"oriverk", email:"se.sterroristalqaeda@gmail.com", password:"riverfield", admin:true)

# general
# make account
(1..5).each do |i|
  nm = (1..4).map { ('あ'..'ん').to_a[rand(20)] }.join
  em = ('a'..'z').to_a.shuffle[1..4].join
  User.create!(name:"#{nm}", email:"#{em}#{i}@gmail.com",password: SecureRandom.base64)
end

# make post
# 一人ずつ3ポスト
  # (1..6).each do |m|
  #   (1..3).each do |s|
  #     postNm = (1..5).map { ('あ'..'ん').to_a[rand(20)] }.join
  #     postEm = ('A'..'Z').to_a.shuffle[1..8].join 
  #     Post.create!(user:"#{m}",name:"#{postNm}", content:"#{postEm}", date:Time.now)
  #   end
  # end

  

