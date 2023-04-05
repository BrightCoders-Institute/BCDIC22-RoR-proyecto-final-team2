class CartController < OnlyphonesController
  def index
    rd = rand 1..2597
    params[:id] = rd
    phone_in_cart = request_api
    @phone_in_cart_img = phone_in_cart['data']['images'][0]['url']
    @phone_in_cart_name = phone_in_cart['data']['name']
    @phone_in_cart_price = phone_in_cart['data']['prices'][0]['price']
  end

end
