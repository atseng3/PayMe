# == Schema Information
#
# Table name: loyalty_users
#
#  id                    :integer          not null, primary key
#  user_id               :string(255)      not null
#  buesiness_id          :string(255)      not null
#  amount                :float            not null
#  tax                   :float            default => 0.0
#  tip                   :float            default => 0.0
#  complete              :boolean          default => false
#  created_at            :datetime
#  updated_at            :datetime

class Check < ActiveRecord::Base
  attr_accessible :user_id, :business_id, :amount, :tip, :tax, :complete
  
  validates :user_id, :business_id, :amount, :tip, :presence => true

  belongs_to :user
  belongs_to :business
end
