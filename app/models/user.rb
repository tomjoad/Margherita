# -*- coding: utf-8 -*-
class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :phone, :street, :home_number, :city, :zip_code, :last_name, :distance, :current_password
  # virtual attributes
  attr_accessor :current_password

  has_secure_password
  has_many :orders

  before_create { |user| user.email = email.downcase }
  before_create :create_remember_token
  before_create :set_role

  ROLES = %w[admin seller customer]
  EMAIL_REGEXP = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
  CITIES = ["Bujaków, Mikołów",
            "Kąty, Mikołów",
            "Paniowy, Gierałtowice",
            "Mokre, Mikołów",
            "Ornontowice",
            "Orzesze",
            "Chudów, Gierałtowice",
            "Paniówki, Mikołów",
            "Dębieńsko, Czerwionka-Leszczyny"]
  ZIP_CODES = %w[01-123 02-123 02-123]
  DISTANCES = Order.all_distances

  validates :email,
  presence: true,
  format: { with: EMAIL_REGEXP },
  uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 6 }, :on => :create
  validates :password_confirmation, presence: true, :on => :create
  # validates :role, presence: true

  def role
    ActiveSupport::StringInquirer.new(self[:role]) if self[:role]
  end

  def update_attributes_with_password_control(params)
    if self.authenticate(params['current_password'])
      # can change password and login
      if params['password'].blank?
        # update all attributes without password
        save_without_params(%w[password password_confirmation], params)
      else
        # update all attributes
        self.update_attributes(params)
      end
    else
      save_without_params(%w[email password password_confirmation], params)
    end
  end


  # def assign_attributes(values, options = {})
  #   sanitize_for_mass_assignment(values, options[:as]).each do |k, v|
  #     send("#{k}=", v)
  #   end
  # end

  private

  # User that signed first is an admin

  def set_role
    if User.count == 0
      self.role = "admin"
    else
      self.role = "customer"
    end
  end

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

  def save_without_params(removed_params, params)
    removed_params.each { |el| params.delete(el) }
    params.each { |k,v| self.send "#{k}=", v }
    # don`t know if save method is the best solution
    self.save
  end

end
