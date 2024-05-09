require "faker"

users = []
5.times do
  password = Faker::Internet.password
  user = User.where(email: Faker::Internet.email).first_or_create(username: Faker::Internet.username, password: password, password_confirmation: password)
  p "created user"
  users << user

  3.times do
    user.notes.create(
      title: "#{Faker::Emotion.adjective.capitalize} message for #{Faker::FunnyName.name}",
      content: Faker::Hacker.say_something_smart,
      creator: Faker::Number.between(from:1, to: 10),
      public: Faker::Boolean.boolean
    )
    p "created note"
  end
end

most_important_note = users[0].notes.create(
  title: "#{Faker::Emotion.adjective.capitalize} message for the team",
  content: Faker::Hacker.say_something_smart,
  public: Faker::Boolean.boolean
)
p "created most important note"

users[1...users.length].each do |user|
  UserNote.create(user_id: user.id, note_id: most_important_note.id)
  puts "Associated user #{user.username} with most important note"
end
