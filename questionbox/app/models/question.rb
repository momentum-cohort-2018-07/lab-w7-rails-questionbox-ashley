class Question < ApplicationRecord
    belongs_to :user
    has_many :answers, dependent: :destroy
    paginates_per 10
    # validates :question_body, presence: true
end
