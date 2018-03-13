class Restuarant < ApplicationRecord
    
    belongs_to :owner, :class_name => "User"
    
    has_many :user_restuarants
    has_many :visitors, through: :user_restuarants, :source => :visitor
    
    
    has_many :dishes
    has_many :ratings
    validates :name, presence: true
    validates :name, uniqueness: true
    
    def add_visitor(current_user)
        if self.visitors.exclude?(current_user)
            self.visitors << current_user
        end
        self.user_restuarants.find_by(user_id: current_user.id).incremenent(:visits, by = 1).save
    end
end
