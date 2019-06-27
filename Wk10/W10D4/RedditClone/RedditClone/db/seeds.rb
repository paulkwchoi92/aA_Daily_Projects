# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = [{
  "username": "bmoorton0@bloomberg.com",
  "password": "C14kFaipCtZ"
}, {
  "username": "cbudibent1@google.ru",
  "password": "EAeVSQyNJ0Ft"
}, {
  "username": "mcordingly2@163.com",
  "password": "QEE3222oJtz7"
}, {
  "username": "odudgeon3@blog.com",
  "password": "xPG3HraU4Qi"
}, {
  "username": "cbaddam4@feedburner.com",
  "password": "3mN8hbIGvs"
}, {
  "username": "akennet5@cdc.gov",
  "password": "pPHCXGX4"
}, {
  "username": "kpiatkow6@wikispaces.com",
  "password": "ogJvIT6mE"
}, {
  "username": "atallis7@mozilla.com",
  "password": "UIxWL7AB7M4"
}, {
  "username": "amucklestone8@liveinternet.ru",
  "password": "seoewkf6gM"
}, {
  "username": "wmaryet9@dropbox.com",
  "password": "d47uT5y7"
}, {
  "username": "ttaffsa@omniture.com",
  "password": "Sptk0D"
}, {
  "username": "achmarnyb@craigslist.org",
  "password": "B097xeQ"
}, {
  "username": "pbentamec@globo.com",
  "password": "BD5jXrLsQB3t"
}, {
  "username": "gferrierd@fema.gov",
  "password": "MShZAd8vr"
}, {
  "username": "fbielfelte@is.gd",
  "password": "0bm8Q35y24P"
}, {
  "username": "mnewbattf@weibo.com",
  "password": "GCC8Ztybjk25"
}, {
  "username": "bohalleghaneg@microsoft.com",
  "password": "QzAz5x7TAj"
}, {
  "username": "tpendellh@nsw.gov.au",
  "password": "qZywnQ"
}, {
  "username": "testemail@gmail.com",
  "password": "123456"
}, {
  "username": "cdittyj@opera.com",
  "password": "qmhvciZ"
}]

# users.each do |user|
#     User.create(
#         username: user["username"],
#         password: user["password"])
#     p "#{user[:username]} has joined!"
# end

10.times do |user|
    a = Faker::Internet.email
User.create(
    username: a,
    password: 123456
)
p "#{a} has joined!"
end

10.times do 
    Sub.create(
        title: Faker::TvShows::Seinfeld.business,
        description: Faker::Quote.yoda,
        user_id: rand(1..100)
    )
    p "Sub has been created!"
    end


