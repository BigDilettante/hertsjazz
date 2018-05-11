class Gig < ApplicationRecord
	has_many	:performances
	has_many	:musicians, through: :performances
	belongs_to :season
end
