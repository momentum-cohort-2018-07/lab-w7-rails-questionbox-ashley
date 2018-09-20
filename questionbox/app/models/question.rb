class Question < ApplicationRecord
    belongs_to :user
    has_many :answers, dependent: :destroy
    # validates :question_body, presence: true
end
