require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    let (:users) {create_list(:user)}

    before {get '/users'}

    it 'returns users' do
      expect(response).to have_http_status(200)
      expect(json).not_to be_empty
    end
    it 'returns users with the correct structure' do
      # Assuming each post has 'title' and 'content'
      json.each do |user|
        expect(post).to include('email', "password_digest")
      end


  end
  def json 
    JSON.parse(response.body)
  end

end
end
require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'POST /users' do
    context 'with valid attributes' do
      it 'creates a new user and returns a success response' do
        post '/users', params:  attributes_for(:user) 
        expect(response).to have_http_status(:created)
        expect(User.count).to eq(1)
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new user and returns an error response' do
        post '/users', params: attributes_for(:user, email: nil) 
        expect(response).to have_http_status(:unprocessable_entity)
        expect(User.count).to eq(0)
      end
    end
  end
end