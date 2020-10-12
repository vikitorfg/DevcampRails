class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end

  def pythondjango
    @pythondjango_portfolio_items = Portfolio.pythondjango
  end

  def new
    @portfolio_items = Portfolio.new
    3.times { @portfolio_items.technologies.build }
  end

  def edit
    @portfolio_items = Portfolio.find(params[:id])
  end

  def show
    @portfolio_items = Portfolio.find(params[:id])
  end

  def create
    @portfolio_items = Portfolio.new(portfolio_items_params)

    respond_to do |format|
      if @portfolio_items.save
        format.html { redirect_to portfolios_path, notice: 'Your Portfolio item was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @portfolio_items = Portfolio.find(params[:id])

    respond_to do |format|
      if @portfolio_items.update(portfolio_items_params)
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @portfolio_items = Portfolio.find(params[:id])

    @portfolio_items.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_path, notice: 'Record was successfully destroyed.' }
    end
  end

  private

  def portfolio_items_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      technologies_attributes: [:name])
  end
end
