require 'rails_helper'

RSpec.describe "Api::V1::ContentsControllers", type: :controller do

  let(:content) {create(:content)}

  describe "POST #create" do
    it "creates a new content" do
      content_params = {title: "New", body: "New"}
      post :create, params: {content: content_params}, format: :as_json
      expect(response).to have_http_status(:create)
    end
  end
end
