class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @flats = policy_scope(Flat)
    # @flats = Flat.all
  end

  def show
    authorize @flat
  end

  def new
    @flat = Flat.new
    authorize @flat
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user_id = current_user.id
    authorize @flat
    @flat.save

    redirect_to new_flat_your_space_path(@flat)
  end

  def edit
    # authorize @flat
  end

  def update
    # authorize @flat
    @flat.update(flat_params)
    redirect_to flats_path
  end

  def destroy
    # authorize @flat
    @flat.destroy
    redirect_to flats_path, status: :see_other
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
    authorize @flat
  end

  def flat_params
    params.require(:flat).permit(:title, :capacity, :address, :city, :monthly_price, :type_of_flat)
  end
end
