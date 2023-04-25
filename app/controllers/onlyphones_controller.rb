require "rest-client"
require "json"

class OnlyphonesController < ApplicationController

  API_KEY = "225960e67adb7b0990d74c1caa657fd119d754557426c82365f2d14345ccb807de74bb10ec58d16c05983903fd090f46dcb20060bdde43c7a7a121ed3531f684aef304c4e1ed3b4c2f1e09f60ce43605091a0a2c6c8e32f6035d5843bec4b8c3a71d05da114dbd7699824b30030361973b43e52a68acdcf863d53bc8b6e240c4"

  def index
   @phones = request_api
   @item_ids = itemid
   @random_phone = random
   @best_phones = bestphones
  end
  
  def create
    transaccion = Transaccion.new
    transaccion.id_comprador = current_user.id
    transaccion.id_vendedor = 1
    transaccion.telefono_id = params[:id]
    transaccion.status = "En carrito"
    transaccion.ganancia = @price
    transaccion.save
    @telefonos_id = Transaccion.where(id_comprador: current_user.id, status: 'En carrito').pluck(:telefono_id)
    session[:telefonos_id] = @telefonos_id
    redirect_to carrito_path
  end
  
  def show
    @phone = request_api
    @phone_img = @phone.dig('data', 'images', 0, 'url') || 'https://picsum.photos/200'
    @price = @phone.dig('data', 'prices', 0, 'price')
    @currency = @phone.dig('data', 'prices', 0, 'currency')
  end
  
  def random
    rd = rand(1..2597)
    params[:id] = rd
    random_phone = request_api
    id = random_phone.dig('data', 'id')
    name = random_phone.dig('data', 'name')
    price = random_phone.dig('data', 'prices', 0, 'price')
    img = random_phone.dig('data', 'images', 0, 'url') || 'https://picsum.photos/200'
    [name, price, img, id]
  end
  
  def request_bestphones
    itemid
    responses = []
    itemid.each do |id|
      params[:id] = id
      response = request_api
      responses << response
    end
    responses
  end
  
  def bestphones
    phones = request_bestphones
    array_phones = []
    (0..7).each do |i|
      id = phones[i].dig('data', 'id')
      name = phones[i].dig('data', 'name')
      price = phones[i].dig('data', 'prices', 0, 'price')
      img = phones[i].dig('data', 'images', 0, 'url') || 'https://picsum.photos/200'
      array_phones << [name, price, img, id]
    end
    array_phones
  end  

  private
  def itemid
    id_array = []
      for i in 1..8
        id_array.push(rand 1..2597)
      end
      id_array
    end

  def request_api
    url = "https://api.device-specs.io/api/smartphones/#{params[:id]}?populate=*"
    response = RestClient.get(url, {Authorization: "Bearer #{API_KEY}"})
    JSON.parse(response.to_str)
  end

  def request_api_filters(filter)
    url = "https://api.device-specs.io/api/smartphones?filters[$and][0][name][$contains]=#{filter}&populate=*"
    response = RestClient.get(url, {Authorization: "Bearer #{API_KEY}"})
    JSON.parse(response.to_str)
  end

end
