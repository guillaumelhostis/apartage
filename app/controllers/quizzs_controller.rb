class QuizzsController < ApplicationController
  before_action :set_quizz, only: [:show, :edit, :update, :destroy]

  def show
    authorize @quizz
  end

  def new
    # if Quizz.find_by(user_id: current_user.id).present?
    #   # flash[:alert] = "Vous avez déjà complété votre quizz"
    #   redirect_to(root_path)
    # else
      @quizz = Quizz.new
      authorize @quizz
    # end
  end

  def create
    if Quizz.find_by(user_id: current_user.id).present?
      @quizz = Quizz.find_by(user_id: current_user.id)
      authorize @quizz
      flash[:notice] = "Vous avez déjà complété votre quizz"
      redirect_to(root_path)
    else
      @quizz = Quizz.new(quizz_params)
      @quizz.file.attach(params[:quizz][:file]) if params[:quizz][:file].present?
      @quizz.user_id = current_user.id
      authorize @quizz
      @quizz.save
      if current_user.role == "senior"
        redirect_to pages_senior_dashboard_path
      elsif current_user.role == "junior"
        redirect_to edit_quizz_path(@quizz)
      end
    end
  end

  def edit
  end

  def update
    @quizz.update(quizz_params)
    if current_user.role == "senior"
      redirect_to pages_senior_dashboard_path
    elsif current_user.role == "junior"
      redirect_to pages_junior_dashboard_path
    end

  end

  private

  def set_quizz
    @quizz = Quizz.find(params[:id])
    authorize @quizz
  end

  def quizz_params
    params.require(:quizz).permit(:smoker, :talker, :guest, :motivation, :gender, :music, :animal, :guest_animal, :junior_smoker, :file)
  end


end
