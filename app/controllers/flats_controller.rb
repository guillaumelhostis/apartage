class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    # @flats = policy_scope(Flat)
    @flats = Flat.all
  end

  def show
    # authorize @flat
  end

  def new
    @flat = Flat.new
    # authorize @flat
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user_id = current_user.id
    # authorize @flat
    @flat.save

    redirect_to flat_path(@flat)
  end

  def edit
    # authorize @flat
  end

  def update
    # authorize @flat
    @flat.update(flat_params)
    # No need for app/views/restaurants/update.html.erb
    redirect_to flat_path(@flat)
  end

  def destroy
    # authorize @flat
    @flat.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to flats_path, status: :see_other
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:title, :capacity, :address, :city, :monthly_price, :type_of_flat, photos: [])
  end
end
