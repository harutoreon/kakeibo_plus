class Entry < ApplicationRecord
  validates :category,     presence: true
  validates :genre,        presence: true
  validates :product_name, presence: true
  validates :quantity,     presence: true
  validates :price,        presence: true
  validates :store_name,   presence: true
end
