class User < ApplicationRecord

  validates_uniqueness_of :username, :case_sensitive => true
  validates_uniqueness_of :email, :case_sensitive => true
  validates :username, presence: true,
            length: { minimum: 10}
  validates :email, presence: true,
             format: {with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
 
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true

  has_secure_password
end
