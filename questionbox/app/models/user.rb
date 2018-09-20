class User < ApplicationRecord
    has_many :questions
    has_many :answers, dependent: :destroy
    has_secure_password
    validates :username, presence: true
    validates :password, presence: true
    validates :email, presence: true
    has_secure_token :api_token
end
