class Card < ApplicationRecord

    belongs_to :user, dependent: :destroy
    has_one :genset, dependent: :destroy
    has_one :card_condition, dependent: :destroy
    has_one_attached :card_image
    # validates :title, presence: true
    validates :title, presence: { message: "Please add a Title"}
    validates :number, presence: { message: "Please add the Card Number"}
    validates :price, presence: { message: "Please add a Price to your Card"}
    
    
end
