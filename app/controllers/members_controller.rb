class MembersController < ApplicationController
	before_action :authenticate_user! 
	before_action :set_member, only: [:show, :edit, :update, :destroy ]

	def index
	  @members = Member.all
	end

	def new
	  @member = Member.new
	  @packages = Package.all
	end

	def create
	  @member = Member.new(member_params)
      if @member.save
        flash[:success] = 'members was successfully created.'
        redirect_to members_path
      else
        render action: :new
      end
	end

	def update
	  if @member.update_attributes(member_params)
		flash[:success] = 'members was successfully updated.'
		redirect_to members_path
	  else
		render action: :edit
	  end
	end

	def associate_package
	   @member = Member.find(params[:member_id])
	end
	
	def destroy
		@member.destroy

		respond_to do |format|
		  format.html { redirect_to members_path }
		end
	end

	def edit
	end

	private
	def member_params
	  params.require(:member).permit(:status, :address,:registration_number,:name,:phone,:email_id,:date_of_birth,:date_of_joining,:renewal_date,:package_id)
	end
	def set_member
	  @member = Member.find(params[:id])
    end
end
