# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  user_name       :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
    require 'securerandom'
    
 
    
    def reset_session_token! 
        self.update!(session_token: self.class.generate_session_token)
        self.session_token
    end
    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
    end

    

end
