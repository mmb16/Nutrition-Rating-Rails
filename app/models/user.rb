class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :ratings
  
  has_many :owned_restuarants, 
    :class_name => "Restuarant", 
    :foreign_key => :owner_id
    
  has_many :user_restuarants
  
  has_many :visited_restuarants, through: :user_restuarants, :source => :restuarant
  #validates :card_number, length: { is: 16 }
  
end
