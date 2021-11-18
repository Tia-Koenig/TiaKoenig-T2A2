class Card < ApplicationRecord
    belongs_to :user

    has_one_attached :card_image




end
