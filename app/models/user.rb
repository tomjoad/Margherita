class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :phone, :street, :home_number, :city, :zip_code, :last_name
  has_secure_password

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  before_save :user_is_customer

  ROLES = %w[admin seller customer]
  EMAIL_REGEXP = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, format: { with: EMAIL_REGEXP }, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  # def role
  #   ActiveSupport::StringInquirer.new(self[:role]) if self[:role]
  # end

  def admin?
    self.role == "admin"
  end

  def seller?
    self.role == "seller"
  end

  def customer?
    self.role == "customer"
  end

  private
    def user_is_customer
      self.role = "customer"
    end

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
