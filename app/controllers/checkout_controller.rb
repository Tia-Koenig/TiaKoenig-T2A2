class CheckoutController < ApplicationController
    
    def create
        
    end

    def buy 
        Stripe.api_key = 'sk_test_51JzDGfB3SnMhuojcOdMVnMKn4BLrIstw1i9Mn2BFgRhy00hn31wr976NU5HOjE8Gm5K0ah8JuE7H83abqrcGb6FM00AeiKZzhA'

        card = Card.find(params[:card_id])

        line_item = {
            price_data: {
                currency: 'aud',
                product_data: {
                    name: card.title,
                },
                unit_amount: card.price * 100,
            },
            quantity: 1,
        }

        session = Stripe::Checkout::Session.create({
            line_items: [line_item],
            mode: 'payment',
            success_url: success_url + "?session_id={CHECKOUT_SESSION_ID}",
            cancel_url: cancel_url,
        })

          redirect_to session.url 
    end

def success 

end 

def cancel 

end

end
