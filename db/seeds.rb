# User.delete_all

# 10.times do |t|
#   User.create(name: Faker::Superhero.name, email: Faker::Internet.free_email, password: '123')
# end

user_a = User.find(3)
user_b = User.find(4)
conversation = Conversation.create(sender_id: user_a.id, recipient_id: user_b.id)
Message.create(user_id: user_a.id, conversation_id: conversation.id, content: Faker::Lorem.sentence)
Message.create(user_id: user_b.id, conversation_id: conversation.id, content: Faker::Lorem.sentence)
Message.create(user_id: user_b.id, conversation_id: conversation.id, content: Faker::Lorem.sentence)
Message.create(user_id: user_a.id, conversation_id: conversation.id, content: Faker::Lorem.sentence)
Message.create(user_id: user_a.id, conversation_id: conversation.id, content: Faker::Lorem.sentence)
Message.create(user_id: user_b.id, conversation_id: conversation.id, content: Faker::Lorem.sentence)
Message.create(user_id: user_b.id, conversation_id: conversation.id, content: Faker::Lorem.sentence)
Message.create(user_id: user_a.id, conversation_id: conversation.id, content: Faker::Lorem.sentence)
Message.create(user_id: user_b.id, conversation_id: conversation.id, content: Faker::Lorem.sentence)
Message.create(user_id: user_a.id, conversation_id: conversation.id, content: Faker::Lorem.sentence)
