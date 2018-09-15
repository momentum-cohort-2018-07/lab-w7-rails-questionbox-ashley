class User < ApplicationRecord
    has_many :questions
    has_many :answers
    has_secure_password
    validates :username, presence: true, uniqueness: true
end
