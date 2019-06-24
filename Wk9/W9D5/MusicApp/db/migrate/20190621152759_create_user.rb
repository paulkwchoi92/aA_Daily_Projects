class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false, index: true, unique: true
      t.string :password_digest, null: false 
      t.string :session_token, null: false, unique: true, index: true

    end
  end
end
