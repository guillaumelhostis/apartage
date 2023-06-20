class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def my_dashboard
     # @my_rentals = Rental.where(user_id: current_user.id)
    # @rentals_requests = Rental.where(flat: Flat.where(user_id: current_user.id))
    @my_rentals = current_user.rentals
    @rentals_requests = current_user.receivedrentals
  end

  def accept_rental
    @rental = Rental.find(params[:format].to_i)
    @rental.accepted
    redirect_to pages_dashboard_path
  end

  def refuse_rental
    @rental = Rental.find(params[:format].to_i)
    @rental.refused
    redirect_to pages_dashboard_path
  end

end
