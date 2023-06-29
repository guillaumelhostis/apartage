class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def my_dashboard
    @my_rentals = current_user.rentals
    @rentals_requests = current_user.receivedrentals
  end

  def accept_rental
    @rental = Rental.find(params[:format].to_i)
    @rental.status == "accepted"
    redirect_to pages_dashboard_path
  end

  def refuse_rental
    @rental = Rental.find(params[:format].to_i)
    @rental.status == "refused"
    redirect_to pages_dashboard_path
  end

  def compatibily(results_a, results_b)
    a = [results_a[:smoker], results_a[:talker], results_a[:guest], results_a[:motivation], results_a[:gender], results_a[:animal], results_a[:guest_animal], results_a[:junior_smoker], results_a[:music]]
    b = [results_b[:smoker], results_b[:talker], results_b[:guest], results_b[:motivation], results_b[:gender], results_b[:animal], results_b[:guest_animal], results_b[:junior_smoker], results_b[:music]]

    matching = matching_algo(a, b)
  end

  def senior_dashboard
    @user = current_user
    @quizz = Quizz.find_by(user_id: current_user.id)
    @flat = Flat.find_by(user_id: current_user.id)
    rentals_requests = Rental.find_by(flat_id: @flat.id)
    if Rental.count <= 1
      @rentals = []
      @rentals << rentals_requests
    else
      @rentals = rentals_requests
    end
  end

  def junior_dashboard
    @user = current_user
    @quizz = Quizz.find_by(user_id: current_user.id)
    @query = params[:query]
    if params[:city].present?
      @flats = Flat.search_by_city(params[:city])
      @seniors_quizz = []
      @flats.each do |f|
        @seniors_quizz << Quizz.find_by(user_id: f.user_id)
      end
      @matching = []
      @flats.each_with_index do |flat, index|
        @matching << {id: flat.id, match: compatibily(@quizz, @seniors_quizz[index]), user_id: flat.user_id}
      end

      @markers = @flats.map do |flat|
        {
          lat: flat.latitude,
          lng: flat.longitude,
          info_window_html: render_to_string(partial: "info_window", locals: { flat: flat }),
          marker_html: render_to_string(partial: "marker")
        }
      end
    else
      @flats = []
    end
  end

  def your_criterias
    @user = current_user
    @quizz = Quizz.find_by(user_id: current_user.id)
  end

  private

  def matching_algo(a, b)
    result =  Levenshtein.normalized_distance(a.join, b.join, threshold=nil)
    percent = result * 100
    final_result = 100 - percent
    return "#{final_result.round(2)} %"
  end
end
