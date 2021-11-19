class Card < ApplicationRecord

    belongs_to :user, dependent: :destroy
    has_one :genset 
    has_one :card_condition
    has_one_attached :card_image

end
