#designing methods for controllers
# first thing specifying routes
# @@ Configu
# go to routes
#  inside routes.draw do () end
## get "/bleats" # this will in the example get the bleats
        #gets is a method that gets called on self
# after this, the router needs to specify which controller actions it needs to go to
## get "/bleats", to: "bleats#index"   # calling index action on bleats controller
#  @ app >controller  create a file called
 # bleats_controller.rb
    # class BleatsControllers < ActionController::Base
      #render plain: "hello world"
      # end


## how to start server :
  #bundle exec rails server


### useful gems
# gem 'better_errors'
# gem 'binding_of_colors'

##communicating through json

# bleats_controller.rb
   # class BleatsControllers < ActionController::Base
     # render json: '{"tommy": "hello"}' #JSON, javasrcript object notation, key: value pair
     # end

### sending back infos

# bleats_controller.rb
   # class BleatsControllers < ActionController::Base
     # bleats = Bleats.all
     # render json: bleats
     #

## building show action
##@@@ inside  routes
 ## Rails.application.route.draw do
   # get"/bleats", to: "bleats#index"
   # get"/bleats/:id" to: "bleats#show"  ## the :id is the wildcard or varaible given to the request
 ##end


 ## @@ BleatsControler

 # bleats_controller.rb
    # class BleatsControllers < ActionController::Base
    # def post
      # bleats = Bleats.all
      # render json: bleats
    # end

     # def show
       #bleat = Bleat.find(params[:id])  # parameter is a method that finds the thing passed in
                                        # because show is a method getting called on .self
                                         #which is a long data, param[id] is necessary to specify :id

       #render json: bleat
     #end


## @@ BleatsController # create action
##@@@ inside  routes
 ## Rails.application.route.draw do
   # get"/bleats", to: "bleats#index"
   # get"/bleats/:id" to: "bleats#show"  ## the :id is the wildcard or varaible given to the request
   # post"/bleats", to: "bleast#create"
 ##end

##@@ insides bleats controller
 # bleats_controller.rb
    # class BleatsControllers < ActionController::Base
    # def index
      # bleats = Bleats.all
      # render json: bleats
    # end

     # def show
       #bleat = Bleat.find(params[:id])  # parameter is a method that finds the thing passed in
                                        # because show is a method getting called on .self
                                         #which is a long data, param[id] is necessary to specify :id

       #render json: bleat
     #end


    ## def create
    # bleats_param = Bleat.new(params.require(:bleat),permit(:author_id, :body)
     #bleat = Bleat.new(bleat_params) #


       # if bleat.save # .save returns true or false if it saved or not
       # render json: bleat
       #else
       # render json: bleat.errors.full_messages, status: 422 #422 is unrprocessable entity
     #end
     #end



   #end

   #how to bypass identity authentication token

##@@@ inside app controler
 #class Ap
  #skip_before_action: verify_authenticity_token
  #end

### save vs save!
 # save renders the error and moves on while save! terminates the process without moving on to the later part


 ### update & destory actions, and resourceful routes

 ## how to change something that is already in the database = put or patch
  #patch request patches onluy some elemtnes of existing database
  #put can overwrite all existing data


## syntax :
##@@@ inside  routes
 ## Rails.application.route.draw do
   # get"/bleats", to: "bleats#index"
   # get"/bleats/:id" to: "bleats#show"  ## the :id is the wildcard or varaible given to the request
   # post"/bleats", to: "bleast#create"
   # put "/bleats/:id", to: "bleats#update"
 ##end

 ##@@ insides bleats controller
  # bleats_controller.rb
     # class BleatsControllers < ActionController::Base
     # def index
       # bleats = Bleats.all
       # render json: bleats
     # end

      # def show
        #bleat = Bleat.find(params[:id])  # parameter is a method that finds the thing passed in
                                         # because show is a method getting called on .self
                                          #which is a long data, param[id] is necessary to specify :id

        #render json: bleat
      #end


     ## def create
     # bleats_param = Bleat.new(params.require(:bleat),permit(:author_id, :body)
      #bleat = Bleat.new(bleat_params) #


        # if bleat.save # .save returns true or false if it saved or not
        # render json: bleat
        #else
        # render json: bleat.errors.full_messages, status: 422 #422 is unrprocessable entity
      #end


      # def update <<-
       #bleat = Bleat.find(params[:id])
       # bleats_param = Bleat.new(params.require(:bleat),permit(:author_id, :body)
       #if bleat.update(bleat_params) # update returns true or false
         # render json: bleat
      # else
       # render json: bleat.errors.full_messages, status: 422
       #end

      #end


      #private
      # def bleat_params  << this makes this easily accessible on other methods
      #   # bleats_param = Bleat.new(params.require(:bleat),permit(:author_id, :body)
      # end




    #end


    #### Delete request
    ## syntax :
    ##@@@ inside  routes
     ## Rails.application.route.draw do
       # get"/bleats", to: "bleats#index"
       # get"/bleats/:id" to: "bleats#show"  ## the :id is the wildcard or varaible given to the request
       # post"/bleats", to: "bleast#create"
       # put "/bleats/:id", to: "bleats#update"
       # delete "/bleats/:id", to: "bleat#destroy" <<<-
     ##end


     ##@@ insides bleats controller
      # bleats_controller.rb
         # class BleatsControllers < ActionController::Base
         # def index
           # bleats = Bleats.all
           # render json: bleats
         # end

          # def show
            #bleat = Bleat.find(params[:id])  # parameter is a method that finds the thing passed in
                                             # because show is a method getting called on .self
                                              #which is a long data, param[id] is necessary to specify :id

            #render json: bleat
          #end


         ## def create
         # bleats_param = Bleat.new(params.require(:bleat),permit(:author_id, :body)
          #bleat = Bleat.new(bleat_params) #


            # if bleat.save # .save returns true or false if it saved or not
            # render json: bleat
            #else
            # render json: bleat.errors.full_messages, status: 422 #422 is unrprocessable entity
          #end


          # def update
           #bleat = Bleat.find(params[:id])
           # bleats_param = Bleat.new(params.require(:bleat),permit(:author_id, :body)
           #if bleat.update(bleat_params) # update returns true or false
             # render json: bleat
          # else
           # render json: bleat.errors.full_messages, status: 422
           #end

          #end

          #def destory <<< --
           # bleat = Bleat.find(params[:id])
           # bleat.destroy
           # render json: "successfully destoryed"
         # end

     # find returns an error if there nothing, never returns a nil
          #private
          # def bleat_params  << this makes this easily accessible on other methods
          #   # bleats_param = Bleat.new(params.require(:bleat),permit(:author_id, :body)
          # end

        #end

        # delete vs destroy
        # delete calls sql actions, but it can still leave traces
        # destory destorys all of it's associated things(all other dependencies)
