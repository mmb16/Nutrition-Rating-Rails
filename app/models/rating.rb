class Rating < ApplicationRecord
    belongs_to :restuarant
    belongs_to :dish
    belongs_to :user
    
    def self.restuarant_rating
        @rating = Rating.all
        @rating.average
    end
end
