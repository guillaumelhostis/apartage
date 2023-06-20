class QuizzsController < ApplicationController
  before_action :set_quizz, only: [:show, :edit, :update, :destroy]

  def show
    authorize @quizz
  end

  def new
    @quizz = Quizz.new
    authorize @quizz
  end

  def create

    @quizz = Quizz.new(quizz_params)

    @quizz.user_id = current_user.id

    authorize @quizz
    @quizz.save
    redirect_to pages_senior_dashboard_path
  end

  def edit
  end

  def update
    @quizz.update(quizz_params)
  end

  private

  def set_quizz
    @quizz = Quizz.find(params[:id])
    authorize @quizz
  end

  def quizz_params
    params.require(:quizz).permit(:smoker, :talker, :guest)
  end


end
