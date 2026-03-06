require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe "#home" do
    it "レスポンスのステータスがokであること" do
      get root_path
      expect(response).to have_http_status(:ok)
    end

    it "見出しがStaticPages#homeであること" do
      get root_path
      expect(response.body).to include('<h1 class="font-bold text-4xl">StaticPages#home</h1>')
    end
  end
end
