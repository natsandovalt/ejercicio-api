class ActivityLogsController < ApplicationController

	def index
		@activity_logs = ActivityLog.includes(:baby).includes(:assistant).includes(:activity).order(start_time: :desc).all
		@activity_logs = @activity_logs.filter(params.slice(:baby, :assistant))
		@babies = Baby.order(:name).all
		@assistants = Assistant.order(:name).all

		#filter by status
		if params[:status]
			if params[:status] == "En progreso"
				@activity_logs = @activity_logs.where("stop_time IS ?", nil)
			elsif params[:status] == "Terminado"
				@activity_logs = @activity_logs.where("stop_time IS NOT ?", nil)
			end
		end
	end
	
end