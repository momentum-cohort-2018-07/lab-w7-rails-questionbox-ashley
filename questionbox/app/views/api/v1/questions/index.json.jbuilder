json.array! @questions do |question|
    json.extract! question, :id, :question_body, :user_id, :title
end