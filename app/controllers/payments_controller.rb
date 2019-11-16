class PaymentsController < ApplicationController
	before_action :authenticate_user! 
	before_action :set_member, only: [:show, :new, :edit, :update, :destroy, :create ]
	def new
   	  @payment = @member.payments.new
  	end

	def create
	  @package = @member.payments.new(payment_params)
		if @package.save
			flash[:success] = 'Payment was successfully created.'
			redirect_to @member
		else
			render action: :new
		end	
	end

	def update
		if @package.update_attributes(package_params)
			flash[:success] = 'Package was successfully updated.'
			redirect_to packages_path
		else
			render action: :edit
		end
	end

	def destroy
	end

	def edit
	end

	private
	def payment_params
	  params.require(:payment).permit(:payment_date, :payment_amount)
  	end

	def set_member
		@member = Member.find(params[:member_id])
	end

end
