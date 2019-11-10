class PackagesController < ApplicationController
	before_action :authenticate_user! 
	before_action :set_package, only: [:show, :edit, :update, :destroy]

	def index
	  @packages = Package.all
	end

	def new
	  @package = Package.new
	end

	def create
	  @package = Package.new(package_params)
		if @package.save
			flash[:success] = 'Package was successfully created.'
			redirect_to packages_path
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
	def package_params
	  params.require(:package).permit(:package_type, :price)		
	end
	def set_package
		@package = Package.find(params[:id])
  end
end
