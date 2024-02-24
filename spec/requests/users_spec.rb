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
        expect(post).to include('email', 'role', "password_digest")
      end


  end
  def json 
    JSON.parse(response.body)
  end

end
end