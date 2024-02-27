User.destroy_all
Post.destroy_all


puts 'Creating main users'

deen = User.create(
  email:                 'deen@example.com',
  password:              'password',
  password_confirmation: 'password',
)
puts deen.email

john = User.create(
  email:                 'john@example.com',
  password:              'password',
  password_confirmation: 'password',
)
puts john.email

jane = User.create(
  email:                 'jane@example.com',
  password:              'password',
  password_confirmation: 'password',
)
puts jane.email


deen.block(john)
jane.block(deen)


puts 'Creating other users'

5.times do
  user = User.create(
    email:                 Faker::Internet.email,
    password:              'password',
    password_confirmation: 'password',
  )
  puts user.email
end


puts 'Creating posts'

User.all.each do |user|
  10.times do
    post = user.posts.create(
      title: Faker::Lorem.sentence(word_count: 3),
      body:  Faker::Lorem.paragraph(sentence_count: 5)
    )
    puts post.title
  end
end


puts 'Blocking users'

User.all.each do |user|
  user.block(User.all.sample)
end
