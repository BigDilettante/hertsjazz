class Season < ApplicationRecord
	has_many	:gigs
	belongs_to	:venue

	default_scope	{ order(year: :desc).order(id: :desc) }

	def full_name
		"#{name} #{year}"
	end

	def self.archive_list
		current_season = Season.where(is_current: true).first
		Season.where(is_current: false)
					.where(is_next: false)
	end

	def self.next_season
		find_by(is_next: true)
	end

	def self.current_season
		find_by(is_current: true)
	end
end
