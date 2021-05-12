# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  def create
    super do |resource|
      if resource.email.blank? || resource.password.blank? || resource.password_confirmation.blank?
        flash[:alert] = t 'devise.failure.email_and_password_can_not_be_blank'
        return redirect_back(fallback_location: root_path)
      end

      unless resource.password == resource.password_confirmation
        flash[:alert] = t 'devise.failure.password_and_confirmation_password_does_not_match'
        return redirect_back(fallback_location: root_path)
      end
    end
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
  end
end
