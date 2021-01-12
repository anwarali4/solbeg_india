class HomeController < ApplicationController
  before_action :check_if_customer_or_admin, only: :index

	
  def index; end


  private
    def check_if_customer_or_admin
    	binding.pry
        if current_user && (current_user.customer? || current_user.admin?)
            redirect_to dashboard_customers_path
        end
    end
end
