namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do

    user = User.last
    40.times do
      content = Faker::Lorem.sentence(5)
      priority = Faker::Lorem.words(3)[2].length
      user.reminders.create!(content: content, priority: priority)
    end
  end
end