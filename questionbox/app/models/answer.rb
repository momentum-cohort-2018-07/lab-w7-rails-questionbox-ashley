class Answer < ApplicationRecord
    belongs_to :question
    belongs_to :user
    paginates_per 10
end
