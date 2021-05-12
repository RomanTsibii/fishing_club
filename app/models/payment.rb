class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :spend

  def purchased?
    !purchased_at.nil?
  end

  def user_full_name
    user.full_name
  end
end
