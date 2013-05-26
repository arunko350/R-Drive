class CollegesController < ApplicationController

	def new
		@college = College.new
	end

	def create
		contact = params[:college][:contact]
		address = params[:college][:address]
		args = params[:college].reject! { |k, v| k == "contact" || k == "address" }
		@college = College.new(args)
		@college.contact = { 
								:office => contact[:office],
								:mobile => contact[:mobile],
								:email => contact[:email]
							}
		@college.address = {
								:line1 => address[:line1],
								:line2 => address[:line2],
								:city => address[:city],
								:state => address[:state],
								:country => address[:country],
								:pincode => address[:pincode]
						   }
		@college.save
		render :text => @college.errors.full_messages
	end

end
