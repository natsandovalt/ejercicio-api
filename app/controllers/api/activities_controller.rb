module API
	class ActivitiesController < ApplicationController
		def index
			activities = Activity.all
			render json: activities, status: :ok
		end
	end
end