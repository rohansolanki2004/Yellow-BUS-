class BusPartner < ApplicationRecord
    has_many :buses , dependent: :destroy

    validates :name , presence: true 
    validates :contact_information, presence: true 
end
