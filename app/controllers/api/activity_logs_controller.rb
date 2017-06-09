module API
	class ActivityLogsController < ApplicationController
		before_action :get_baby_activity_logs

		def get_baby_activity_logs
			@al = ActivityLog.all.baby(params[:baby_id])
		end

		def index
			render json: @al, status: :ok
		end

		def create
			activity_log = ActivityLog.new(activity_log_params)
			if activity_log.save
				render json: activity_log, status: :created, location: activity_log
			else
				render json: activity_log.errors, status: :unprocessable_entity
			end
		end

		def update
			activity_log = ActivityLog.find(params[:id])

			#check if it is a valid date
			start_time = activity_log.start_time
			stop_time = activity_log_update_params[:stop_time]

			if start_time < stop_time
				if activity_log.update(activity_log_update_params)
					render json: activity_log, status: :accepted, location: activity_log
				else
					render json: activity_log.errors, status: :unprocessable_entity
				end
			else
				render json: { :errors => "Fecha de terminación anterior a la de inicio" }, status: :unprocessable_entity
			end
		end

		private

			def activity_log_params
				params.require(:activity_log).permit(:activity_id, :baby_id, :assistant_id, :start_time)
			end

			def activity_log_update_params
				params.require(:activity_log).permit(:stop_time, :comments, :duration)
			end
	end
end