class CardsController < ApplicationController
    before_action :setup_genset_and_card_condition, only: [:new, :edit]
    before_action :find_card_setup, only: [:update, :edit, :show, :destroy]
    # before_action :authenticate_user!, except: [:index]
    #add :show when created ^ 


    def index
        @cards = Card.order(title: :asc)
        @gensets = Genset.all
    end
    
    def new 
        @card = Card.new 
    end

    def create 
        @card = Card.new(card_params)
        @card.user_id = current_user.id
        @card.save
        redirect_to card_path(@card.id)
    end 

    def edit 
        find_card_setup
    end

    def update 
        find_card_setup
        @card.update(card_params)
        redirect_to card_path(@card.id)
    end

    def destroy 
        @card.delete
        redirect_to cards_path
    end

    def show 
        find_card_setup
        @genset = Genset.find(@card.genset_id)
        @card_condition = CardCondition.find(@card.card_condition_id)
    end

    def get_card_id 
        @card_id = params[:id].to_i
    end

    def card_params
        params.require(:card).permit(:title, :number, :price, :genset_id, :card_condition_id)
    end

    def setup_genset_and_card_condition
        @genset = Genset.order(:id)
        @card_condition = CardCondition.order(:id)
    end

    def find_card_setup
        @card = Card.find(params[:id])
    end
end
