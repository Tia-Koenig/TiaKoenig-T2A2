class Card < ApplicationRecord

    belongs_to :user, dependent: :destroy
    has_one :genset, dependent: :destroy
    has_one :card_condition, dependent: :destroy
    has_one_attached :card_image

end
