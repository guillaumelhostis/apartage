class RentalsController < ApplicationController
  before_action :set_rental, only: %i[ show edit update destroy ]

  def new
    @rental = Rental.new
    @flat = Flat.find(params[:flat_id])
    authorize @rental
  end

  def create
    @rental = Rental.new(rental_params)
    # @rental.user_id = current_user[:id]
    @flat = Flat.find(params[:flat_id])
    @rental.flat = @flat
    @rental.user = current_user
    @rental.status = 2
    authorize @rental

    @rental.save
    redirect_to my_dashboard_path
  end

  def show
    authorize @rental
  end

  # def index
  #   @rentals = policy_scope(Rental)
  # end

  def edit
    authorize @rental
  end

  def update
    authorize @rental

    @rental.update(rental_params)

    redirect_to pages_dashboard_path
  end

  def destroy
    authorize @rental
    @rental.destroy

    redirect_to pages_dashboard_path
  end

  private

  def set_rental
    @rental = Rental.find(params[:id])
  end

  def rental_params
    params.require(:rental).permit(:check_in, :message)
  end
end
