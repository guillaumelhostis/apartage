class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @flats = policy_scope(Flat)
    # @flats = Flat.all

  end

  def show

    authorize @flat
    @flat_owner = @flat.user
    @user = current_user
    @your_space = @flat.your_spaces.first
    @rental = Rental.new
  end

  def new
    @flat = Flat.new
    authorize @flat
  end

  def create
    if Flat.find_by(user_id: current_user.id).present?
      @flat = Flat.find_by(user_id: current_user.id)
      authorize @flat
      flash[:notice] = "Vous avez déjà créer un logement"
      redirect_to pages_senior_dashboard_path
    else
      @flat = Flat.new(flat_params)
      @flat.user_id = current_user.id
      authorize @flat
      @flat.save

      redirect_to new_flat_your_space_path(@flat)
    end

  end

  def edit
    # authorize @flat
  end

  def update
    @flat.update(flat_params)
    authorize @flat
    @yourspace = YourSpace.find_by(flat_id: @flat.id)
    redirect_to edit_your_space_path(@yourspace)
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
    params.require(:flat).permit(:title, :capacity, :address, :city, :monthly_price, :type_of_flat, photos: [])
  end
end
