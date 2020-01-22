class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: true
    validates :username, presence: true
    has_many :sessions
    has_many :messages, through: :sessions
    

end 