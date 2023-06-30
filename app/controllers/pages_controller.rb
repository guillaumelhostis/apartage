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
    @rental.status = "accepted"
    @rental.save
    redirect_to pages_senior_dashboard_path
  end

  def refuse_rental
    @rental = Rental.find(params[:format].to_i)
    @rental.status = "refused"
    @rental.save
    redirect_to pages_senior_dashboard_path
  end

  def senior_dashboard
    @user = current_user
    @quizz = Quizz.find_by(user_id: current_user.id)
    @flat = Flat.find_by(user_id: current_user.id)
    rentals_requests = Rental.where(flat_id: @flat.id)
    if Rental.count <= 1
      @rentals = []
      @rentals << rentals_requests
    else
      @rentals = rentals_requests

    end
    @matching = []
    @juniors_quizz = []
    if rentals_requests.present?
      @rentals.each_with_index do |rental, index|
        @juniors_quizz << Quizz.find_by(user_id: rental.user_id)
        @matching << { id: rental.id, match: compatibily(@quizz, @juniors_quizz[index]), user_id: rental.user_id }
      end
    end
  end

  def junior_dashboard
    @user = current_user
    @quizz = Quizz.find_by(user_id: current_user.id)
    @query = params[:query]
    if @query.present?
      @flats = Flat.search_by_city(@query[:city])
      # @query[:your_space] = ["tv", "wifi", "toilet"]
      if @query[:your_space]
        @flats = @flats.joins(:your_spaces).where(your_spaces: {tv: true}) if  @query[:your_space].include? 'tv'
        @flats = @flats.joins(:your_spaces).where(your_spaces: {bathroom: true}) if @query[:your_space].include? 'bathroom'
        @flats = @flats.joins(:your_spaces).where(your_spaces: {terrasse: true}) if @query[:your_space].include? 'terrasse'
        @flats = @flats.joins(:your_spaces).where(your_spaces: {wifi: true}) if @query[:your_space].include? 'wifi'
        @flats = @flats.joins(:your_spaces).where(your_spaces: {toilet: true}) if @query[:your_space].include? 'toilet'
      end
      @flats = @flats.where('monthly_price <= 300') if @query[:price_range] == '0-300€'
      @flats = @flats.where('monthly_price > 300 and monthly_price <= 500') if @query[:price_range] == '301€-500€'
      @flats = @flats.where('monthly_price > 500') if @query[:price_range] == '>500€'

      @seniors_quizz = []
      @flats.each do |f|
        @seniors_quizz << Quizz.find_by(user_id: f.user_id)
      end
      @matching = []
      @flats.each_with_index do |flat, index|
        @matching << { id: flat.id, match: compatibily(@quizz, @seniors_quizz[index]), user_id: flat.user_id }
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

  def candidat
    @rental = Rental.find(params[:format])
    @user = current_user
    @junior = User.find(@rental.user_id)
    @matching = compatibily(Quizz.find_by(user_id: @junior.id), Quizz.find_by(user_id: current_user.id))
  end

  def candidats
    @flat = Flat.find_by(user_id: current_user.id)
    @rentals = Rental.where(flat_id: @flat.id)
    @user = current_user

  end

  private

  def matching_algo(a, b)
    result =  Levenshtein.normalized_distance(a.join, b.join, threshold=nil)
    percent = result * 100
    final_result = 100 - percent
    return "#{final_result.round(2)} %"
  end

  def compatibily(results_a, results_b)
    a = [results_a[:smoker], results_a[:talker], results_a[:guest], results_a[:motivation], results_a[:gender], results_a[:animal], results_a[:guest_animal], results_a[:junior_smoker], results_a[:music]]
    b = [results_b[:smoker], results_b[:talker], results_b[:guest], results_b[:motivation], results_b[:gender], results_b[:animal], results_b[:guest_animal], results_b[:junior_smoker], results_b[:music]]

    matching = matching_algo(a, b)
  end
end
