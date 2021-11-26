class CardsController < ApplicationController
    before_action :authenticate_user!, except: [:index]
    before_action :check_authorization, except: [:index, :show, :new, :create]
    before_action :find_card, only: [:update, :edit, :show, :destroy]
    before_action :setup_genset_and_card_condition, only: [:new, :edit, :show, :create]


    def index
        @cards = Card.order(title: :asc)
        @gensets = Genset.all
        @card_conditions = CardCondition.all
    end
    
    def new 
        @card = Card.new 
        
    end

    def create
        @card = Card.new(card_params)
        @card.user_id = current_user.id
        begin
            @card.save!
            redirect_to card_path(@card.id)
        rescue 
            flash.now[:errors] = @card.errors.messages.values.flatten
            render 'new'
        end
    end 

    def edit 
        begin

        rescue 
            
        end
    end

    #need to add flash error for update

    def update
        @card.update(card_params)
        redirect_to card_path(@card.id)
    end

    def destroy 
        @card.delete
        redirect_to cards_path
    end

    def show 
        begin
            @user = current_user
            @genset = Genset.find(@card.genset_id)
            @card_condition = CardCondition.find(@card.card_condition_id)
        rescue 
            redirect_to user_session_path
        end
    end

    def card_params
        params.require(:card).permit(:title, :number, :price, :genset_id, :card_condition_id, :card_image)
    end

    def setup_genset_and_card_condition
        @genset = Genset.order(:id)
        @card_condition = CardCondition.order(:id)
    end

    def find_card
        @card = Card.find(params[:id])
    end

    def check_authorization
        @card = find_card
        authorize @card
    end
  

end
