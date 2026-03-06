require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe "#home" do
    it "レスポンスのステータスがokであること" do
      get root_path
      expect(response).to have_http_status(:ok)
    end

    it "タイトルがトップページであること" do
      get root_path
      expect(response.body).to include('<title>トップページ</title>')
    end

    it "見出しがkakeibo+であること" do
      get root_path
      expect(response.body).to include('<h1 class="text-5xl font-bold">Kakeibo +</h1>')
    end
  end
end
