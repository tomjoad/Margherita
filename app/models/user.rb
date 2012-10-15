# -*- coding: utf-8 -*-
class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :phone, :street, :home_number, :city, :zip_code, :last_name, :distance, :role
  has_secure_password
  has_many :orders

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  before_save :set_role

  ROLES = %w[admin seller customer]
  EMAIL_REGEXP = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  CITIES = ["Bujaków", "Ornontowice", "Kąty", "Chudów", "Pelców", "Stara Huta", "Orzesze"]
  ZIP_CODES = %w[01-123 02-123 02-123]
  DISTANCES = %w[0-6 6-8]

  validates :email,
  presence: true,
  format: { with: EMAIL_REGEXP },
  uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  # validates :role, presence: true

  def role
    ActiveSupport::StringInquirer.new(self[:role]) if self[:role]
  end

  private

  # User that signed first is an admin

  def set_role
    if User.count == 0
      self.role = "admin"
    else
      self.role = "customer"
    end
  end

  # def user_is_admin
  #   self.role = "admin"
  # end

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
