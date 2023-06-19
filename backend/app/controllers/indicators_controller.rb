class IndicatorsController < ApplicationController
  before_action :set_indicator, only: [:destroy, :update]

  def index
    render json: { dynamic_attributes: Indicator.pluck(:dynamic_attributes) }
  end

  def destroy
    indicator = params[:indicator]
    @indicator.dynamic_attributes.delete(indicator)
    if @indicator.save
      render json: { message: "Indicator successfully updated" }
    else
      render json: { error: "Failed to update indicator" }, status: :unprocessable_entity
    end
  end

  def update
    indicator = params[:indicator]
    @indicator.dynamic_attributes << indicator
    if @indicator.save
      render json: { message: "Indicator successfully updated" }
    else
      render json: { error: "Failed to update indicator" }, status: :unprocessable_entity
    end
  end

  private

  def set_indicator
    @indicator = Indicator.first
  end
end
