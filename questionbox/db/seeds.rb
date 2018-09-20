# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

100.times do
    User.create!(
        username: Faker::Internet.username,
        email: Faker::Internet.email,
        password: Faker::Internet.password,
        password_confirmation: @password
    )
    end

50.times do
    Question.create!(
        title: Faker::FamousLastWords.last_words,
        question_body: Faker::Community.quotes,
        user_id: Faker::Number.between(1, 100)
    )
end

35.times do
    Answer.create!(
        answer_body: Faker::DumbAndDumber.quote,
        user_id: Faker::Number.between(1, 100),
        question_id: Faker::Number.between(1, 50)
    )
end
