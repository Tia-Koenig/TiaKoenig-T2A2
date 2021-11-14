class CardsController < ApplicationController
    before_action :authenticate_user!, except: [:index]
    #add :show when created ^ 


    def index
        # @cards = Card.order(number: :asc)
    end

    def new 
    end

    def create 
    end 

    def update 
    end

    def delete 
    end

    def show 
    end
    
end
