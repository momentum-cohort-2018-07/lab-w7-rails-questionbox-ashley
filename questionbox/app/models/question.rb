class Question < ApplicationRecord
    belongs_to :user
    has_many :answers, dependent: :destroy
    # paginates_per 5
    has_one_attached :image
    validates :question_body, presence: true
end
