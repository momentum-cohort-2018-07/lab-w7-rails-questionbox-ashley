class User < ApplicationRecord
    has_many :questions, dependent: :destroy
    has_many :answers
    has_secure_password
    validates :username, presence: true, uniqueness: true
    paginates_per 5
    # has_secure_token :api_token
end
