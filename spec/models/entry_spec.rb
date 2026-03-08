require 'rails_helper'

RSpec.describe Entry, type: :model do
  let!(:entry) {
    Entry.new(
      category: '支出',
      genre: '食費',
      product_name: 'せいろ蒸し 赤飯おこわおむすび',
      quantity: 1,
      price: 158,
      store_name: 'セブン-イレブン 広畑店',
    )
  }

  it 'entryが有効であること' do
    expect(entry).to be_valid
  end

  it 'categoryが存在すること' do
    entry.category = nil
    expect(entry).not_to be_valid
    expect(entry.errors[:category]).to include("can't be blank")
  end

  it 'genreが存在すること' do
    entry.genre = nil
    expect(entry).not_to be_valid
    expect(entry.errors[:genre]).to include("can't be blank")
  end

  it 'product_nameが存在すること' do
    entry.product_name = nil
    expect(entry).not_to be_valid
    expect(entry.errors[:product_name]).to include("can't be blank")
  end

  it 'quantityが存在すること' do
    entry.quantity = nil
    expect(entry).not_to be_valid
    expect(entry.errors[:quantity]).to include("can't be blank")
  end

  it 'priceが存在すること' do
    entry.price = nil
    expect(entry).not_to be_valid
    expect(entry.errors[:price]).to include("can't be blank")
  end

  it 'store_nameが存在すること' do
    entry.store_name = nil
    expect(entry).not_to be_valid
    expect(entry.errors[:store_name]).to include("can't be blank")
  end
end
