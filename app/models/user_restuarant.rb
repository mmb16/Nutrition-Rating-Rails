class UserRestuarant < ApplicationRecord
    belongs_to :restuarant
    
    belongs_to :visitor, 
        :class_name => "User",
        :foreign_key => "user_id"
        
        def self.total_visits
            self.first.visits
            #require 'pry'; binding.pry
        end
end
