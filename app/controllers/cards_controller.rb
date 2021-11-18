class CardsController < ApplicationController
    # before_action :authenticate_user!, except: [:index]
    #add :show when created ^ 


    def index
        @cards = Card.order(title: :asc)
    end
    
    def new 
        @card = Card.new 
    end

    def create 
        # @card = Card.new
        # if @card.save
        #     # redirect_to @card
        # else #add flash error
        # end
        render json: params
    end 

    def update 
        
    end

    def destroy 
        
    end

    def show 
        @card = Card.find(params[:id])
    end

    def get_card_id 
        @card_id = params[:id].to_i
    end
    
end
