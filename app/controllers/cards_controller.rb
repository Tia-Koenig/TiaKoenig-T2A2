class CardsController < ApplicationController
    # before_action :authenticate_user!, except: [:index]
    #add :show when created ^ 


    def index
        @cards = Card.order(title: :asc)
    end
    
    def new 
        @card = Card.new 
        @genset = Genset.order(:id)
        @card_condition = CardCondition.order(:id)
    end

    def create 
        @card = Card.new(card_params)
        @card.user_id = current_user.id
        @card.save

        redirect_to card_path(@card.id)
    end 

    def edit 
        
    end

    def update 
        
    end

    def destroy 
        
    end

    def show 
        @card = Card.find(params[:id])
        @genset = Genset.find(@card.genset_id)
        @card_condition = CardCondition.find(@card.card_condition_id)
    end

    def get_card_id 
        @card_id = params[:id].to_i
    end

    def card_params
        params.require(:card).permit(:title, :number, :price, :genset_id, :card_condition_id)
    end
    
end
