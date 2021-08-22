class User < ApplicationRecord
  after_create :assign_default_role

  # Refers to Roles
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :payments
  has_many :spends, through: :payments

  has_one_attached :avatar

  validates :email, :password, presence: false
  validates :first_name, :last_name, presence: true
  validates :email, uniqueness: true unless :email.blank?

  def full_name
    [first_name, last_name].each(&:capitalize!).join(' ')
  end

  def avatar_image
    return avatar if avatar.attached?

    'fish_man.jpg'
  end

  def status
    id.odd?
  end

  def admin!
    add_role(:admin)
  end

  def admin?
    has_role? :admin
  end

  def fisher?
    has_role? :fisher
  end

  private

  def assign_default_role
    add_role(:fisher) if roles.blank?
  end

  def password_required?
    false
  end

  def email_required?
    false
  end
end
