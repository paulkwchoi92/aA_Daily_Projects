# //inside rails
# // have jbuilder gem 

//inside view, api, bleat, index.json.jbuilder 

# {
#     "name" : "TOmmy"
# }

#  can be equl to 
json.set!(:name, "Tommy")


# routes :

namespace :api, default:{format: json} do # all that comes through api space should be as json 
    resources :bleats 
# ########

json.array!  @bleats do |bleat|
    json.set!(:id, bleat.id)
    json.set!(:body, bleat.body)
    json.set!(:author_id, bleat.author_id)  # can be re written as
    json.id(bleat.id)
    json.body bleat.body
    json.author_id bleat.author_id #can be re written as
    json,.extract! bleat, :id, :bopdy, :author_id # can be re written as 
    json.partgial! "/api/bleats/bleat", bleat: bleat
    json.author do 
        json.extract! bleat.author, :id, :email 
    end
end


## normalizedd state

json.array!  @bleats do |bleat|
    # json.set!(:id, bleat.id)
    # json.set!(:body, bleat.body)
    # json.set!(:author_id, bleat.author_id)  # can be re written as
    # json.id(bleat.id)
    # json.body bleat.body
    # json.author_id bleat.author_id #can be re written as
    # json,.extract! bleat, :id, :bopdy, :author_id # can be re written as 
    json.partial! "/api/bleats/bleat", bleat: bleat
    json.author do 
        json.extract! bleat.author, :id, :email 
        json.authored_bleats do 
            json.array! bleat.author.authored_bleat do |bleat|
                json.partial! "/api/bleats/bleat"
    end
end
# can be re written as 

{
    bleats: {
        1:{id: 1, body: "something", author_id: 1}
        3:{id: 3, body: "something", author_id: 3}
    }
},
    user: {
        1: {id: 1, emnail: "asdfasdfasdf", authored_bleats_id:[1]
    }
} # this is thef orm we want other than nested form above 

json.bleat do 
    @bleats.each do |bleat|
        json.set! bleat.id do
            json.partial! "/api/bleats/bleat", bleat:bleat 
        end
    end
end

json.users do 
    @bleats.map(&:author).each do |user|
        json.set! user.id do
            json.extract! user, :id, :name, :authored_bleat_ids 
        end
    end
end


## selctors
