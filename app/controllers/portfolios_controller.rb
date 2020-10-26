class PortfoliosController < ApplicationController
  before_action :set_portfolio_items, only: %i[edit show update destroy]
  access all: %i[show index pythondjango], user: { except: %i[destroy new create update edit] }, site_admin: :all

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

  def edit; end

  def show; end

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
    respond_to do |format|
      if @portfolio_items.update(portfolio_items_params)
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @portfolio_items.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_path, notice: 'Record was successfully destroyed.' }
    end
  end

  private

  def set_portfolio_items
    @portfolio_items = Portfolio.find(params[:id])
  end

  def portfolio_items_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      technologies_attributes: [:name])
  end
end
