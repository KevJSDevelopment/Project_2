class WishlistsController < ApplicationController

  before_action :find_wishlist, only: [:show, :edit, :update, :destroy]

  def index
    @wishlists = Wishlist.where(user_id: session[:user_id])
  end

  def show
  end

  def new
    @wishlist = Wishlist.new
  end
  
  def create
    @wishlist = Wishlist.new(name: wishlist_params[:name], user_id: session[:user_id])
    if @wishlist.save
      redirect_to wishlist_path(@wishlist.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @wishlist.update(wishlist_params)
      redirect_to wishlist_path(@wishlist.id)
    else 
      render :edit
    end
  end

  def destroy
    @wishlist.destroy
    redirect_to wishlists_path
  end

  private

  def wishlist_params
    params.require(:wishlist).permit(:name)
  end

  def find_wishlist
    @wishlist = Wishlist.find(params[:id])
  end

end
