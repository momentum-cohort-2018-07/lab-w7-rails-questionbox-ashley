json.array! @answers do |answer|
    json.extract! answer, :id, :answer_body, :user_id, :question_id
end