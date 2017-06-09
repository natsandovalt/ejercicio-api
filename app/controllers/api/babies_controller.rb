module API
	class BabiesController < ApplicationController
		def index
			babies = Baby.all
			render json: babies, status: :ok
		end

		def show
			baby = Baby.find(params[:id])
			render json: baby, status: :ok
		end

		def activity_logs
			baby = Baby.find(params[:id])
			activity_logs = baby.activity_logs
			render json: activity_logs, status: :ok
		end
	end
end