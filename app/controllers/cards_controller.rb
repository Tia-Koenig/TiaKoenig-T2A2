class CardsController < ApplicationController
    before_action :check_authorization
    before_action :find_card, only: [:update, :edit, :show, :destroy]
    before_action :setup_genset_and_card_condition, only: [:new, :edit, :show, :create]
    before_action :check_user, only: [:edit, :update, :destroy]
    

    #add :show when created for account, so when they click account, if theyre logged in, they'll see their information, if not, redirect to login 


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
        @genset = Genset.find(@card.genset_id)
        @card_condition = CardCondition.find(@card.card_condition_id)
        @user = current_user.id
    end

    def get_card_id 
        @card_id = params[:id].to_i
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
        authorize Card
    end

    
    private 
    
    def check_user
        begin user_signed_in? && (current_user.has_role?("admin") || current_user.id == @card.user_id )
            return true
        rescue 
            flash[:alert] = "You are not authorized to do that!"
            redirect_to root_path
        end
    end
end
