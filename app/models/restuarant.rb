class Restuarant < ApplicationRecord
    
    belongs_to :owner, :class_name => "User"
    
    has_many :user_restuarants
    has_many :visitors, through: :user_restuarants
    
    
    has_many :dishes
    has_many :ratings
    validates :name, presence: true
    validates :name, uniqueness: true
end
