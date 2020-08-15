class Product < ApplicationRecord
  has_many :images, dependent: :destroy
  has_many :basket_products, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
end