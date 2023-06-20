class YourSpacesController < ApplicationController
  before_action :set_rental, only: %i[ show edit update destroy ]

  def new
    @yourspace = YourSpace.new
    @flat = Flat.find(params[:flat_id])
    authorize @yourspace
  end

  def create
    @yourspace = YourSpace.new(yourspace_params)
    # @yourspace.user_id = current_user[:id]
    @flat = Flat.find(params[:flat_id])
    # @yourspace.flat_id = @flat[:id]
    @yourspace.flat = @flat
    authorize @yourspace

    @yourspace.save
    redirect_to new_quizz_path
  end

  # def show
  #   authorize @yourspace
  # end

  def edit
    authorize @yourspace
  end

  def update
    authorize @yourspace

    @yourspace.update(yourspace_params)

    redirect_to pages_dashboard_path
  end

  def destroy
    authorize @yourspace
    @yourspace.destroy

    redirect_to my_dashboard_path
  end

  private

  def set_rental
    @yourspace = YourSpace.find(params[:id])
  end

  def yourspace_params
    params.require(:your_space).permit(:tv, :bathroom, :terrasse, :wifi, :toilet)
  end
end
