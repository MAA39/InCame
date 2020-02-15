class PortfoliosController < ApplicationController
  def index
    @portfolios= Portfolio.all
  end

  def show
    @portfolio = Portfolio.find(params[:id])
    @user = User.new
  end

  def new
    @portfolio = Portfolio.new
  end
  
  def create
    @portfolio = Portfolio.new(portfolio_params)
    if @portfolio.save
      redirect_to root_path, notice: 'Success!'
    else
      flash[:alert] = 'Save error!'
      render :new
    end
  end

  def edit
    @portfolio = Portfolio.find(params[:id])
  end
  
  def update
    @portfolio = Portfolio.find(params[:id])
    if @portfolio.update(portfolio_params)
      redirect_to root_path, notice: 'Success!'
    else
      flash[:alert] = 'Save error!'
      render :edit
    end
  end
  
  def destroy
    @portfolio = Portfolio.find(params[:id])
    @portfolio.destroy
    redirect_to root_path,notice: 'Success!'
  end
  
  private
    def portfolio_params
      params.require(:portfolio).permit(:name, :title, :content)
    end
  
  
  
  
  
end
