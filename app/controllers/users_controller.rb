class UsersController < ApplicationController
    
    before_action :find_user, only: [:show, :edit, :update, :destroy]

    def show
    end

    def new
        @user = User.new
    end

    def login
        render :login_form
    end

    def process_login
        user = User.find_by(name: params[:name])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to user_path(user.id)
        else
            flash.now[:no_user] = "No user found with that username or password" 
            render :login_form
        end
    end

    def logout
        session.clear
        flash[:message] = "You have been logged out"
        redirect_to login_path
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            render :new
        end
    end

    def edit
    end

    def update
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            render :edit
        end
    end

    def destroy
        @user.destroy
        redirect_to user_deleted_path
    end

    def user_deleted
        session.clear
        render :user_deleted
    end

    private
    
    def user_params
        params.require(:user).permit(:name, :password)
    end

    def find_user
        @user = User.find(params[:id])
    end
end
