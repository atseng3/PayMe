# == Schema Information
#
# Table name: loyalty_users
#
#  id                    :integer          not null, primary key
#  sender_id             :string(255)      not null
#  recipiant_id          :string(255)      not null
#  amount                :float            not null
#  created_at            :datetime
#  updated_at            :datetime

class Check < ActiveRecord::Base
  # attr_accessible :title, :body
end
