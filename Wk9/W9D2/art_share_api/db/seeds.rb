# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'byebug'
names = [
    {'email' => 'Ilka@gnet.serve'},
    {'email'  => 'Ervin@ydos.parse'},
    {'email'  => 'Davey@darvey.dave'},
    {'email' => 'Desmund@hesmund.centro'},
    {'email'  => 'Flora@flowers.sun'},
    {'email' => 'asdxcv@rails.rails'},
    {'email'  => 'sdfxcv@sql.sql'},
    {'email' => 'zxcvsdf@css.css'},
    {'email'  => 'sdfxcv@ruby.org'},
    {'email' => 'Aasdf@ruby,ruby'}
]

names.each do |userDeats|
    User.create(username:userDeats['email'])
    p "username created with email: #{userDeats["email"]}"
end

artwork_titles = [
    {'title' => 'matrices', 'url' => 'zxcvedf.com', 'artist_id' => 1}, 
    {'title' =>'superstructure','url' => 'zxcvedfdf.com', 'artist_id' => 2},
    {'title' =>'implementation','url' => 'zxcwfdvedf.com', 'artist_id' => 3},
    {'title' =>'Total','url' => 'zxcvedf.com', 'artist_id' => 4},
    {'title' =>'5th generation','url' => 'zxcvedfsdf.com', 'artist_id' => 5},
    {'title' =>'content-based','url' =>'zxcvdfvedf.com', 'artist_id' =>6},
    {'title' =>'mobile','url' => 'zxcveeredf.com', 'artist_id' => 7},
    {'title' =>'mobiled2','url' => 'zeeredf.com', 'artist_id' => 7},
    {'title' =>'hobile','url' => 'zxcveeredf.com', 'artist_id' => 7},
    {'title' =>'tobile','url' => 'zxcveeredf.com', 'artist_id' => 7},
    {'title' =>'asymmetric','url' => 'zxcvefxcvdf.com','artist_id' => 8},
    {'title' =>'optimizing','url' => 'zxcvgetddf.com','artist_id' => 9},
    {'title' =>'ability','url' => 'zxcvefyrfdf.com','artist_id' => 10}
]

artwork_titles.each do |map|
    # debugger
    if Artwork.create(title: map["title"], image_url: map['url'], artist_id: map['artist_id'])
        p "#{map["title"]} created and hosted at: #{map['url']}"
    else
        p "IT DIDNT WORK FOOL"
    end
end

ArtworkShare.create(artwork_id: 1, viewer_id: 1)
ArtworkShare.create(artwork_id: 1, viewer_id: 2)
ArtworkShare.create(artwork_id: 1, viewer_id: 3)
ArtworkShare.create(artwork_id: 2, viewer_id: 4)
ArtworkShare.create(artwork_id: 3, viewer_id: 4)
ArtworkShare.create(artwork_id: 4, viewer_id: 5)
ArtworkShare.create(artwork_id: 4, viewer_id: 6)
ArtworkShare.create(artwork_id: 5, viewer_id: 7)
ArtworkShare.create(artwork_id: 6, viewer_id: 8)
ArtworkShare.create(artwork_id: 5, viewer_id: 8)
ArtworkShare.create(artwork_id: 7, viewer_id: 9)
ArtworkShare.create(artwork_id: 8, viewer_id: 10)
ArtworkShare.create(artwork_id: 9, viewer_id: 10)
ArtworkShare.create(artwork_id: 10, viewer_id: 10)

comments = [
    {body: "Managed methodical infrastructure", author_id: 2, artwork_id: 1},
    {body: "Universal web-enabled flexibility", author_id:3 , artwork_id:2 },
    {body: "Optimized incremental emulation", author_id: 5, artwork_id: 7},
    {body: "User-friendly fault-tolerant alliance", author_id: 3, artwork_id:7 },
    {body: "Upgradable local time-frame", author_id: 4, artwork_id: 5},
    {body: "Operative maximized challenge", author_id: 2, artwork_id: 2},
    {body: "Inverse mission-critical application", author_id:1 , artwork_id:4 },
    {body: "Reduced coherent interface", author_id:3 , artwork_id: 4},
    {body: "Visionary logistical encoding", author_id:2 , artwork_id:7 },
    {body: "Cross-platform tertiary framework", author_id: 10, artwork_id: 7},
    {body: "Digitized reciprocal intranet", author_id:5 , artwork_id: 8},
    {body: "Upgradable incremental throughput", author_id:10 , artwork_id: 1},
    {body: "Reduced didactic moratorium", author_id: 2, artwork_id: 1},
    {body: "Synchronised coherent solution", author_id: 2, artwork_id: 3},
    {body: "Diverse next generation product", author_id: 4, artwork_id: 3},
    {body: "Implemented bottom-line open system", author_id:4, artwork_id:5 },
    {body: "Pre-emptive bifurcated encoding", author_id: 6, artwork_id:6 },
    {body: "Reduced radical algorithm", author_id: 8, artwork_id:3 },
    {body: "Managed encompassing website", author_id: 10, artwork_id: 2},
    {body: "Networked holistic hub", author_id: 10, artwork_id: 4},
    {body: "Front-line mobile middleware", author_id: 8, artwork_id: 1},
    {body: "Profit-focused system-worthy Graphical User Interface", author_id: 7, artwork_id: 10},
    {body: "Organic tangible budgetary management", author_id: 3, artwork_id: 2},
    {body: "Quality-focused grid-enabled adapter", author_id: 5, artwork_id:3 },
    {body: "Devolved attitude-oriented policy", author_id: 4, artwork_id:7 },
    {body: "Focused zero defect access", author_id: 3, artwork_id: 1},
    {body: "Realigned attitude-oriented hierarchy", author_id: 2, artwork_id: 10},
    {body: "Polarised bi-directional hierarchy", author_id: 2, artwork_id: 10},
    {body: "Centralized systemic migration", author_id: 1, artwork_id:10 },
    {body: "Streamlined actuating moratorium", author_id: 1, artwork_id: 10}
]

comments.each do |hash|
    Comment.create(body:hash[:body], author_id:hash[:author_id], artwork_id:hash[:artwork_id])
    p "#{hash[:body]} has been created by #{hash[:author_id]} for #{hash[:artwork_id]}!"
end

Like.create(likeable_type: :Comment, likeable_id: Comment.first.id)
Like.create(likeable_type: :Comment, likeable_id: Comment.first.id)
Like.create(likeable_type: :Comment, likeable_id: Comment.third.id)
Like.create(likeable_type: :Comment, likeable_id: Comment.third.id)
Like.create(likeable_type: :Comment, likeable_id: Comment.third.id)
Like.create(likeable_type: :Comment, likeable_id: Comment.third.id)
Like.create(likeable_type: :Comment, likeable_id: Comment.third.id)
Like.create(likeable_type: :Artwork, likeable_id: Artwork.fourth.id)
Like.create(likeable_type: :Artwork, likeable_id: Artwork.fourth.id)
Like.create(likeable_type: :Artwork, likeable_id: Artwork.fourth.id)
Like.create(likeable_type: :Artwork, likeable_id: Artwork.fourth.id)
Like.create(likeable_type: :Artwork, likeable_id: Artwork.fourth.id)
Like.create(likeable_type: :Comment, likeable_id: Comment.fifth.id)
Like.create(likeable_type: :Comment, likeable_id: Comment.second.id)
Like.create(likeable_type: :Comment, likeable_id: Comment.second.id)
Like.create(likeable_type: :Comment, likeable_id: Comment.second.id)
Like.create(likeable_type: :Comment, likeable_id: Comment.second.id)
Like.create(likeable_type: :Artwork, likeable_id: Artwork.second.id)
Like.create(likeable_type: :Artwork, likeable_id: Artwork.first.id)
Like.create(likeable_type: :Artwork, likeable_id: Artwork.first.id)
Like.create(likeable_type: :Artwork, likeable_id: Artwork.first.id)
Like.create(likeable_type: :Artwork, likeable_id: Artwork.first.id)
Like.create(likeable_type: :Artwork, likeable_id: Artwork.first.id)
Like.create(likeable_type: :Artwork, likeable_id: Artwork.first.id)
Like.create(likeable_type: :Artwork, likeable_id: Artwork.first.id)
