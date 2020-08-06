require 'rails_helper'

RSpec.describe "ImageVideos", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/image_videos/index"
      expect(response).to have_http_status(:success)
    end
  end

end
