class ChecksController < ApplicationController
  def index 
    
  end
  
  def new
    @check = Check.new()
    render :new
  end
  
  def create
    # clean up the string to figure out if email or phone number
    search_term = sanitize_input(params[:search_term])
    # search_term comes back as false if not email or phone number
    
    # maybe there's a better/more efficient way to do this part?
    if search_term
      @recipient = User.find_by_email(search_term) || User.find_by_phone_number(search_term)
    else
      flash[:danger] = @recipient.errors.full_messages
      redirect_to user_url(current_user)
    end
    params[:check][:recipient_id] = @recipient.id
    @check = Check.new(params[:check])
    
    # need to add validations on save, currently it allows nil values
    if @check.save
      flash[:success] = ["Hurray! You've sent a check!"]
      redirect_to user_url(current_user)
    else
      flash[:danger] = @check.errors.full_messages
      redirect_to user_url(current_user)
    end
  end
  
  # def edit
  #   @check = Check.find(params[:check][:id])
  #   render :edit
  # end
  
  def update
    @check = Check.find(params[:check][:id])
    if @check.update_attributes(params[:check])
      flash[:success] = ["You've successfully updated completed a check!!"]
      redirect_to user_url(current_user)
    else
      flash[:danger] = @check.errors.full_messages
      redirect_to user_url(current_user)
    end
  end
  
  def show
    
  end
  
  def destroy
    
  end
  
end
