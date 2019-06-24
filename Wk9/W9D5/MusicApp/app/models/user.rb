# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#

class User < ApplicationRecord 
    after_intialize :ensure_session_token  

    validates :email, :session_token, presence: true, uniqueness: true 
    validates :password_digest, presence: true 
    validates :password, length: { minimum: 6 }, allow_nil: true 
                    # reason why we "allow_nil" for password is because
                    # password itself is not a attribute saved to the db


    def self.generate_session_token 
        SecureRandom::urlsafe_based64(16) #creating a random string for token
    end

    def password=(password)
        @password = password 
        self.password_digest = BCrypt::Password.create(password)
    end

    def reset_session_token!
        self.update!(session_token: self.class.generate_session_token)
        self.session_token
    end 
    
    def self.find_by_credentials(email, password)
        user = User.find_by(email: email)
        return nil unless user && user.is_password?(password)
        user
    end

    def is_password?(password)
        bcrypt_password = BCrypt::Password.new(self.password_digest)
        bcrypt_password.is_password?(password)
    end


    private 
    def ensure_session_token 
        self.session_token ||= self.class.generate_session_token 
        # what this line means is since session_token is part of the user
        #table self.session_token will return true if session_token
        #is available if not it will generate a session_token with the
        # .genterate_session_token method
    end
end
