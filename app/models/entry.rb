class Entry < ApplicationRecord
  validates :category,     presence: true
  validates :genre,        presence: true
  validates :product_name, presence: true
  validates :quantity,     presence: true
  validates :price,        presence: true
end
