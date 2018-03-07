class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_restuarants
  has_many :restuarants, through: :user_restuarants
  has_many :ratings
  #validates :card_number, length: { is: 16 }
  #validates :phone_number, numericality: { only_integer: true }
  
end
