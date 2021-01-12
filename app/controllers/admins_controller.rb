class AdminsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_is_admin
  before_action :set_admin, only: [:edit, :update]
  def dashboard; end

	def edit; end

	def update
		if @admin.update_attributes(permitted_admin_params)
			flash[:notice] = "Profile is updated succesfully"
			redirect_to  dashboard_admins_path
		else
			flash[:alert] = "Something went wrong!"
			redirect_to edit_admin_path(@customer)
		end
	end

  private

	  def set_admin
	    @admin = Admin.find(params[:id])
	  end

	  def permitted_admin_params
	    params.require(:admin).permit(:telephone)
	  end
end
