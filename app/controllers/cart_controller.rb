class CartController < OnlyphonesController

  def index

    rd = rand 1..2597
    params[:id] = rd
    phone_in_cart = request_api
    @phone_in_cart_img = phone_in_cart['data']['images'][0]['url']
    @phone_in_cart_name = phone_in_cart['data']['name']
    @phone_in_cart_price = phone_in_cart['data']['prices'][0]['price']

    @counter = 1

  end

  def increase
    @counter += 1
    redirect_to carrito_path
  end

  def decrease
    @counter -= 1
    redirect_to carrito_path
  end

end
