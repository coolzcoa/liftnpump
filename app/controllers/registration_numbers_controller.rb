class RegistrationNumbersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_reg_no, only: [:show, :edit, :update, :destroy ]
	def new
   	  @registration_number = RegistrationNumber.new
  	end

	def create
	end

	def update
        if @reg_no.update_attributes(reg_no_params)
            flash[:success] = 'Registratio Number successfully updated.'
            redirect_to members_path
        else
            render action: :edit
        end
	end

	def destroy
	end

    def edit
      @registration_number = RegistrationNumber.first
	end

	private
	def reg_no_params
	  params.require(:registration_number).permit(:reg_no)
  	end

	def set_reg_no
	  @reg_no = RegistrationNumber.first
	end

end
