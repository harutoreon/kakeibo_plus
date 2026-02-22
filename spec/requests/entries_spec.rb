require 'rails_helper'

RSpec.describe "Entries", type: :request do
  describe "#index" do
    let!(:entries) {
      Entry.create(
        category: '支出',
        genre: '食費',
        product_name: 'せいろ蒸し 赤飯おこわおむすび',
        quantity: 1,
        price: 158
      )
    }

    it "レスポンスのステータスがokであること" do
      get entries_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe "#show" do
    before do
      @entry = Entry.new(
        category: '支出',
        genre: '食費',
        product_name: 'せいろ蒸し 赤飯おこわおむすび',
        quantity: 1,
        price: 158
      )
      @entry.save
    end

    it "レスポンスのステータスがokであること" do
      get entry_path(@entry)
      expect(response).to have_http_status(:ok)
    end
  end
end
