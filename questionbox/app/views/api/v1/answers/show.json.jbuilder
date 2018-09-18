json.links do
    json.self api_v1_answer_url(@answer)
    json.list api_v1_answers_url
    json.update do
      json.method "PUT"
      json.href api_v1_answer_url(@answer)
    end
    json.delete do
      json.method "DELETE"
      json.href api_v1_answer_url(@answer)
    end
  end
  json.data do
    json.id @answer.id
    json.attributes do
      json.answer_body @answer.answer_body
      json.user_id @answer.user_id
      json.question_id @answer.question_id
    end
end