json.links do
    json.self api_v1_user_url(@user)
    json.list api_v1_users_url
    json.update do
      json.method "PUT"
      json.href api_v1_user_url(@user)
    end
    json.delete do
      json.method "DELETE"
      json.href api_v1_user_url(@user)
    end
  end
  json.data do
    json.id @user.id
    json.attributes do
      json.api_token @user.api_token
      json.username @user.username
      json.email @user.email
      json.password_digest @user.password_digest
      # json.password_confirmation @user.password_confirmation
    end
end