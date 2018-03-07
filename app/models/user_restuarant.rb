class UserRestuarant < ApplicationRecord
    belongs_to :restuarant
    
    belongs_to :visitor, 
        :class_name => "User",
        :foreign_key => "user_id"
end
