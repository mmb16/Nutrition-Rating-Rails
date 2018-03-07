class Restuarant < ApplicationRecord
    has_many :user_restuarants
    has_many :users, through: :user_restuarants
    has_many :dishes
    has_many :ratings
    validates :name, presence: true
    validates :name, uniqueness: true
end
