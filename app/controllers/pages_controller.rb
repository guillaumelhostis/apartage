class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def compatibily
    results_a = Quizz.find(3)
    results_b = Quizz.find(4)
    a = [results_a[:smoker], results_a[:talker], results_a[:guest]]
    b = [results_b[:smoker], results_b[:talker], results_b[:guest]]

    @matching = matching_algo(a, b)
  end

  def senior_dashboard
    @user = current_user
    @quizz = Quizz.find_by(user_id: current_user.id)
    @flat = Flat.find_by(user_id: current_user.id )
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
