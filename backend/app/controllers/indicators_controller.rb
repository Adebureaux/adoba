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

    # Check for duplicate indicator
    if @indicator.dynamic_attributes.include?(indicator)
      render json: { error: "Cet indicateur existe déjà" }, status: :unprocessable_entity
      return
    end

    # Check string length
    if indicator.length < 3 || indicator.length > 30
      render json: { error: "L'indicateur doit être entre 3 et 30 caractères" }, status: :unprocessable_entity
      return
    end

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
