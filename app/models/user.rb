
# == Schema Information
#
# Table name: loyalty_users
#
#  id                    :integer          not null, primary key
#  password_digest       :string(255)      not null
#  session_token         :string(255)      not null
#  f_name                :string(255)      not null
#  l_name                :string(255)      not null
#  phone_number          :string(255)      not null
#  email                 :string(255)      not null
#  created_at            :datetime
#  updated_at            :datetime

class User < ActiveRecord::Base
  attr_accessible :f_name, :l_name, :email, :password, :phone_number
  attr_reader :password
  
  validates :password_digest, :presence => { :message => "Password can't be blank"}
  validates :password, :length => { :minimum => 8, :allow_nil => true }
  validates :f_name, :l_name, :email, :session_token, :phone_number, :presence => true
  validates :phone_number, :uniqueness => true, :length => { :is => 10 }
  validates :email, :uniqueness => true, :format => /[\w\.%\+\-]+@(?:[A-Z0-9\-]+\.)+(?:[A-Z]{2,}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|jobs|museum)/i

  after_initialize :ensure_session_token, :sanitize_fields
  
  has_many :checks,
           :primary_key => :id,
           :foreign_key => :recipient_id,
           :class_name => 'Check'
  
  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    
    return nil if user.nil?
    
    user.is_password?(password) ? user : nil
  end
  
  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end
  
  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
  
  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
  end
  
  private
    def ensure_session_token
      self.session_token ||= self.class.generate_session_token
    end

    def sanitize_fields
      self.phone_number = self.phone_number.gsub(/[^0-9]/, "") if self.phone_number
      self.email = self.email.downcase if self.email
    end
end
