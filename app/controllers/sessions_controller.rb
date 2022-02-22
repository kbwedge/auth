class SessionsController < ApplicationController

    def new
    end

    def create

        entered_email = params["email"]
        entered_password = params["password"]
        
        #checking email
        @user = User.find_by({email: entered_email})
        
        if @user #yes, email matches
            #check the password, send to companies page if match
            if BCrypt::Password.new(@user.password) == entered_password
                flash[:notice] = "Welcome!"
                redirect_to "/companies"
            else #password doesn't match, redirect to login
                flash[:notice] = "Incorrect Password"
                redirect_to "/sessions/new"
            end
        else #email doesn't match, send back to login
            flash[:notice] = "Incorrect Email Address"
            redirect_to"/sessions/new"
        end 


    end


end
