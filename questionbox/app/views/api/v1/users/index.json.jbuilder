json.array! @users do |user|
    json.extract! user, :id, :username, :email, :password_digest, :password_confirmation
end