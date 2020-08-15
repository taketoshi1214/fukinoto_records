class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :basket, dependent: :destroy

  def prepare_basket
    basket || create_basket
  end

  def checkout!(token, product_ids:)
    total = basket.total_price(product_ids: product_ids)
    basket_products = basket.basket_products.where(product_id: product_ids)
    basket_products.each(&:destroy!)
    Charge.create!(total, token)
  end
end
