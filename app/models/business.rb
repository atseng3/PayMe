class Business < ActiveRecord::Base
  attr_accessible :name, :password
  attr_reader :password
  
  validates :password_digest, :presence => { :message => "Password can't be blank"}
  validates :password, :length => { :minimum => 8, :allow_nil => true }
  validates :name, :sesson_token, :presence => true

  after_initialize :ensure_session_token

  has_many :checks_sent,
           :primary_key => :id,
           :foreign_key => :recipient_id,
           :class_name => 'Check'

  def self.find_by_credentials(name, password)
    business = Business.find_by_name(name)
    
    return nil if business.nil?
    
    business.is_password?(password) ? business : nil
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
end
