class UsersController < ApplicationController
 
 def create
   @portfolio =Portfolio.find(params[:portfolio_id])
   @user = User.new
   if @user.update(user_params)
     redirect_to portfolio_path(@portfolio), notice: 'Success!'
   else
     redirect_to portfolio_path(@portfolio), alert: 'Invalid' 
   end
 end
 
  def edit
   @portfolio =Portfolio.find(params[:portfolio_id])
   @user = @portfolio.users.find(params[:id])
  end
  
  def update
   @portfolio =Portfolio.find(params[:portfolio_id])
   @user = @portfolio.users.find(params[:id])
   if @user.update(user_params)
    redirect_to portfolio_path(@portfolio), notice: 'Success!'
   else
    flash[:alert] = 'Invalid!'
    render :edit
   end
  end
  
  def destroy
   @portfolio =Portfolio.find(params[:portfolio_id])
   @user = @portfolio.users.find(params[:id])
   @user.destroy
   redirect_to portfolio_path(@portfolio) , notice: 'Deleted!'
  end
  
  
  private
  def user_params

    params.require(:user).permit(:content, :name , :portfolio_id)
  end
  
  
end
