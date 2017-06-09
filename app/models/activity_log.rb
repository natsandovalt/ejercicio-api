class ActivityLog < ActiveRecord::Base
	include Filterable
	belongs_to :activity
	belongs_to :assistant
	belongs_to :baby

	scope :baby, -> (baby_id) {where baby_id: baby_id}
	scope :assistant, -> (assistant_id) {where assistant_id: assistant_id}
end