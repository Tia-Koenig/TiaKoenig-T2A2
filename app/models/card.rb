class Card < ApplicationRecord

    belongs_to :user, dependent: :destroy
    belongs_to :genset 
    belongs_to :card_condition
    has_one_attached :card_image

end
