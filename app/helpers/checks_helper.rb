module ChecksHelper
  def sanitize_input(search_term)
    # do email and phone number check
    # return false if it is not a email or a phone number,
    # otherwise return phone number or email and indicator of what type it is
    
    # currently just returning search_term directly
    return search_term
    phone_number = phone_number.gsub(/[^0-9]/, "") if phone_number
    email = email.downcase if email
  end
end
