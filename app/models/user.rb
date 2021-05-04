class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  validates :email, :password, presence: false
  validates :first_name, :last_name, presence: true

  def full_name
    [first_name, last_name].join(' ')
  end

  def active?
    id.odd?
  end

  private

  def password_required?
    false
  end

  def email_required?
    false
  end
end
