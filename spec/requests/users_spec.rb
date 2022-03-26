require 'rails_helper'

describe 'Users API', type: :request do
  describe 'GET /users' do
    it 'returns all users' do
      FactoryBot.create(:user, email: "email@mail.com", username: "username",
                              password: "123456", password_confirmation: "123456")
      FactoryBot.create(:user, email: "email1@mail.com", username: "username1",
                              password: "123456", password_confirmation: "123456")
      
      get '/users'

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end
  describe 'Post /users' do
    it 'creates a new user' do
      expect {
      post '/users', params: { user: { email: "test@test.com", username: "test", 
                                       password: "123456", password_confirmation: "123456" } }
      }.to change { User.count }.from(0).to(1)
      
      expect(response).to have_http_status(:created)
    end
  end
  describe 'Delete /users/:id' do
    it 'deletes a user' do
      user = FactoryBot.create(:user, email: "email@mail.com", username: "username",
        password: "123456", password_confirmation: "123456")
      expect {
        delete "/users/#{user.id}"
      }.to change { User.count }.from(1).to(0)
      expect(response).to have_http_status(:no_content)
    end
  end


end