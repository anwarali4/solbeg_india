class Admin::CustomersController < ApplicationController
    before_action :set_customer, only: [:edit, :update]

	def index
		@customers = Customer.all
	end

	def edit; end

	def update
		if @customer.update_attributes(permitted_customer_params)
			flash[:notice] = "Profile is updated succesfully"
			redirect_to  admin_customerss_path
		else
			flash[:notice] = "Something went wrong!"
			redirect_to edit_admin_customer_path(@customer)
		end
	end

  private

	  def set_customer
	    @customer = Customer.find(params[:id])
	  end

	  def permitted_customer_params
	    params.require(:customer).permit(:name, :profile_image, :telephone,
      address_attributes: [
        :line_1, 
        :street, 
        :landmark, 
        :city,
        :pin_code,
        :pin_code
      ])
	  end

end
