class CardCondition < ApplicationRecord

    # belongs_to :cards
    has_many :cards
    
end
