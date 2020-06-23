class PortfoliosController < ApplicationController
  def index
    @portfolio_item = Portfolio.ruby_on_rails_portfolio_items
  end 

  def angular
    @angular_portfolio_items = Portfolio.angular
  end 

  def new
    @portfolio_item = Portfolio.new
  end 

  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end  

  def create
    @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

   def update
    @portfolio_item = Portfolio.find(params[:id])
    
    respond_to do |format|
      if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio_item }
      else
        format.html { render :edit }
        format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @portfolio_item = Portfolio.find(params[:id])

    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end 

  def show
    @portfolio_item = Portfolio.find(params[:id])
  end  
end
