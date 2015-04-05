class User < ActiveRecord::Base
  has_secure_password

  validate :validate_name_or_email

  def validate_name_or_email
    if name.blank? && email.blank?
      errors.add(:name_or_email, 'Should not blank both name and email.')
    end
  end
end
