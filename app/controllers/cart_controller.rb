class CartController < OnlyphonesController

  def index

    rd = rand 1..2597
    params[:id] = rd
    phone_in_cart = request_api
    @phone_in_cart_img = phone_in_cart['data']['images'][0]['url']
    @phone_in_cart_name = phone_in_cart['data']['name']
    @phone_in_cart_price = phone_in_cart['data']['prices'][0]['price']

    session[:counter] ||= 1

  end

  def increment
    session[:counter] += 1
    render json: { value: session[:counter] }
  end

  def decrement
    if session[:counter] == 0
      session[:counter] ||= 1
    end 
    session[:counter] -= 1
    render json: { value: session[:counter] }
  end

end
