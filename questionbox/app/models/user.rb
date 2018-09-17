class User < ApplicationRecord
    has_many :questions, dependent: :destroy
    has_many :answers, dependent: :destroy
    has_secure_password
    validates :username, presence: true, uniqueness: true
    validates :password, presence: true, length: {minimum: 5}
    # paginates_per 5
    # has_secure_token :api_token
end
