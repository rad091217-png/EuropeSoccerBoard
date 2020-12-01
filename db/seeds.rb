User.create!(name: "Example User",
             email: "k@example.c",
             password: "koukouki",
             password_confirmation: "koukouki",
             admin: true)

# 追加のユーザーをまとめて生成する
99.times do |n|
  name = Faker::Name.name
  email = "example-#{n + 1}@example.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end
