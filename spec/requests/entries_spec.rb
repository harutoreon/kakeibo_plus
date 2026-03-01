require 'rails_helper'

RSpec.describe "Entries", type: :request do
  describe "#index" do
    let!(:entry) {
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

    it "タイトルが収支の一覧であること" do
      get entries_path
      expect(response.body).to include('<title>収支の一覧</title>')
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

    it "タイトルが収支の詳細であること" do
      get entry_path(@entry)
      expect(response.body).to include('<title>収支の詳細</title>')
    end
  end

  describe "#new" do
    it "レスポンスのステータスがokであること" do
      get new_entry_path
      expect(response).to have_http_status(:ok)
    end

    it "タイトルが収支の新規登録であること" do
      get new_entry_path
      expect(response.body).to include('<title>収支の新規登録</title>')
    end
  end

  describe "#create" do
    let(:entry_params) do
      {
        entry: {
          category: '支出',
          genre: '食費',
          product_name: 'せいろ蒸し 赤飯おこわおむすび',
          quantity: 1,
          price: 158
        }
      }
    end

    it "新規作成後のリダイレクト先がshowページであること" do
      post entries_path, params: entry_params
      entry = Entry.last
      expect(response).to redirect_to(entry_path(entry))
    end
  end

  describe "#edit" do
    let!(:entry) {
      Entry.create(
        category: '支出',
        genre: '食費',
        product_name: 'せいろ蒸し 赤飯おこわおむすび',
        quantity: 1,
        price: 158
      )
    }

    it "レスポンスのステータスがokであること" do
      get edit_entry_path(entry)
      expect(response).to have_http_status(:ok)
    end

    it "タイトルが収支の編集であること" do
      get edit_entry_path(entry)
      expect(response.body).to include('<title>収支の編集</title>')
    end
  end

  describe "update" do
    let!(:entry) {
      Entry.create(
        category: '支出',
        genre: '食費',
        product_name: 'せいろ蒸し 赤飯おこわおむすび',
        quantity: 1,
        price: 158
      )
    }

    it "更新後のリダイレクト先がshowページであること" do
      patch entry_path(entry), params: { entry: { price: 200 } }
      expect(response).to redirect_to(entry_path(entry))
    end
  end

  describe "#destroy" do
    let!(:entry) {
      Entry.create(
        category: '支出',
        genre: '食費',
        product_name: 'せいろ蒸し 赤飯おこわおむすび',
        quantity: 1,
        price: 158
      )
    }

    it "レスポンスのステータスがsee_otherであること" do
      delete entry_path(entry)
      expect(response).to have_http_status(:see_other)
    end
  end
end
