# == Schema Information
#
# Table name: loyalty_users
#
#  id                    :integer          not null, primary key
#  sender_id             :string(255)      not null
#  recipient_id          :string(255)      not null
#  amount                :float            not null
#  created_at            :datetime
#  updated_at            :datetime

class Check < ActiveRecord::Base
  attr_accessible :sender_id, :recipient_id, :amount
  
  belongs_to :user,
             :primary_key => :id,
             :foreign_key => :recipient_id,
             :class_name => 'User'
end
