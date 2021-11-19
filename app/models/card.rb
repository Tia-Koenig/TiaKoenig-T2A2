class Card < ApplicationRecord
    belongs_to :user, dependent: :destroy
    belongs_to :genset 
    belongs_to :card_condition
    has_one :genset 
    has_one :card_condition
    has_one_attached :card_image
    # has_many :genset
    # accepts_nested_attributes_for :genset
    # has_one :set, through :genset
    # has_one :condition, through :card_condition




end
