class Product < ApplicationRecord
  validates :images, presence: true
  validates :title,
            :artist,
            :label,
            :year,
            :format,
            :made_in,
            :vinyl,
            :jacket,
            :price,
            :comment_track_list,
            presence: true

  has_many :images, dependent: :destroy
  has_many :basket_products, dependent: :destroy
  has_many :purchase_product_records, dependent: :destroy
  belongs_to :admin

  accepts_nested_attributes_for :images, allow_destroy: true


end