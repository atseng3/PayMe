# == Schema Information
#
# Table name: loyalty_users
#
#  id                    :integer          not null, primary key
#  sender_id             :string(255)      not null
#  recipient_id          :string(255)      not null
#  amount                :float            not null
#  tax                   :float            default => 0.0
#  tip                   :float            default => 0.0
#  complete              :boolean          default => false
#  created_at            :datetime
#  updated_at            :datetime

class Check < ActiveRecord::Base
  attr_accessible :sender_id, :recipient_id, :amount, :tip, :tax, :complete
  
  belongs_to :user,
             :primary_key => :id,
             :foreign_key => :recipient_id,
             :class_name => 'User'

  belongs_to :business,
             :primary_key => :id,
             :foreign_key => :sender_id,
             :class_name => 'Business'
end
