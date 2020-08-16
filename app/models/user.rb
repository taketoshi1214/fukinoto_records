class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :basket, dependent: :destroy
  has_one :purchase_record, dependent: :destroy

  def prepare_basket
    basket || create_basket
  end

  def prepare_purchase_record
    purchase_record || create_purchase_record
  end

  def checkout!(token, product_ids:)
    total = basket.total_price(product_ids: product_ids)

    transaction do
    basket_products = basket.basket_products.where(product_id: product_ids)
    basket_products.each(&:destroy!)

    purchase_record = prepare_purchase_record
    ids = product_ids.map { |id| { product_id: id } }
    purchase_record.purchase_record_products.create!(ids)
    end

    Charge.create!(total, token)

  end
end
