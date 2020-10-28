require 'rails_helper'

RSpec.describe 'GoodThings', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/good_things/index'
      expect(response).to have_http_status(:success)
    end
  end
end
