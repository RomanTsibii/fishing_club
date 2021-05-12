class Spend < ApplicationRecord
  has_many :payments
  has_many :users, through: :payments

  validates :name, :price, presence: true

  after_save :create_payments_for_users
  after_destroy :remove_payments_for_users

  private

  def create_payments_for_users
    User.all.each { |user| Payment.create(user: user, spend: self) }
  end

  def remove_payments_for_users
    Payment.where(spend_id: id).destroy_all
  end
end
