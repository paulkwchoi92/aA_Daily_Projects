### unit testing on rails

# required gems
## inside developments: test
  #gem 'rspec-rails'
  #gem 'shoulda-matchers' #helps us write model tests
  #gem 'factory_bot_rails'
  #gem 'faker' #allows us to create fake data
  #bundle exec rails generate rspec:install
    ## this will install rspec files to test
  #inside .rspec file
    ## --require spec_helper
     # --color
     # --format documentation


  #inside config/application.rb
    config.generators do |g|
      g.test_framework :rspec,
      :fixtures => false,
      :view_specs => flase,
      :helper_specs => false,
      :controller_specs => true,
      :request_specs => false

  #### inside rails helper
    Shoulda::Matchers.configure do |config}
      config.integrate do |with|
        with.test_framework :rspec
        with.library :rails


#### inside spec files
  #testing for models will be
  #model folder -> modelfilename_spec.rb

require 'rails_helper'

 RSpec.describe User, type: :model do
   it { should validate_presence_of(:email)}
   it { should validate_length_of(:password).is_at_least(6)}
   it { should has_many(:authored_bleats)}

   describe 'uniqueness' do


     before(:each) do
       User.create!(
         email: tomm@add.io,
         password: 'hunter',
         location: Location.create(name:"argentina")
      )
    end
      it {should validate_uniqueness_of(:email)}
      it { shnould validate_uniqueness_of(:enmail)}
     end
 end



 ## list of shoulda matcher can be found on googble

 #inside sepc -> factories/ userl
  #facortryBot.define do
    factory :user do
      Faker::Email
      password {'hunter2'}
      association :location, factory :location
    end

     #inside sepc -> factories/ ;ocation

    Factory.define do
      factory :location do
        name do
          Faker::Moives::StarTrek
      end
    end
### inside rails helper
  Rspec.configure do |config|
    config.include FactoryBot::Syntax::Methods

    # will allow us to use # create

    ##### having this inside factories will allows us to


    before(:each) do
      User.create!(
        # email: tomm@add.io,
        # password: 'hunter',
        # location: Location.create(name:"argentina")
        creat(:user) # refactor the above line into create
     )
   end


   #### inside user_pec

   describe '#is_password?' do
     let(:user) {create(:user)}
     context "with a valid password" do
       it 'returns ture' do
         expect*(user.is_password?('hunter2')).to be(true)
       end
     end

     context 'w/invalid password' do
       it 'return false' do
         expect(user.is_password?(hunter3)).to be (false)
       end





  #### rails generate rspec:foldername , tablename

  ex

  rails generate rspec:controller user
     $ spec/controller/users_controller_spec.rb

  rails gnereate rspec:model uesr
   # spec/model/user_spec.rb

   rails generate rspec:feature auth
