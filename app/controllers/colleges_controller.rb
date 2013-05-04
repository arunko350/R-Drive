class CollegesController < ApplicationController

	def new
		@college = College.new
	end

end
