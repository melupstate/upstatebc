class UsersController < ApplicationController
   def new
    @user = User.new
  end
   def edit
    @user = User.find(params[:id])
  end
  def create
    new_email = params[:user][:email]
    verifyuseremail = User.where(email: new_email.downcase)
    verifyusername = User.where(username: params[:user][:username])
    verifyemail = VerifiedUser.where(:email => new_email.downcase)
     if verifyemail.exists? && !verifyuseremail.exists? && !verifyusername.exists?  # verified and not currently a user
       @user = User.create(user_params)
      if @user.save
      else
        respond_to do |format|
              format.js { render :new}
              format.html { render :new }
              format.json { render json: @user.errors, status: :unprocessable_entity }
         end
      end
     else # either user exists or is not verified to create an account
     end
  end
end
