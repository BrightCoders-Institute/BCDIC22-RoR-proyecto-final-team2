require "rest-client"
require "json"
require_relative "./api_key"

class OnlyphonesController < ApplicationController

  def index
   @phones = request_api
   @item_ids = itemid
   @random_phone = random
   @best_phones = bestphones
  end
  
  def show
    @phone = request_api
    begin
      @phone_img = @phone['data']['images'][0]['url']
    rescue NoMethodError => e
      if e.message.include?("undefined method `[]' for nil:NilClass") 
        @phone_img = "https://picsum.photos/200" 
      else
        @phone_img = @phone['data']['images'][0]['url']
      end
    end
    @price = @phone['data']['prices'][0]['price']
    @currency = @phone['data']['prices'][0]['currency']
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

  def random
    rd = rand 1..2597
    params[:id] = rd
    random_phone = request_api
    id = random_phone['data']['id']
    name = random_phone['data']['name']
    price = random_phone['data']['prices'][0]['price']
    begin
      img = random_phone['data']['images'][0]['url']
    rescue NoMethodError => e
      if e.message.include?("undefined method `[]' for nil:NilClass") 
        img = "https://picsum.photos/200" 
      else
        img = random_phone['data']['images'][0]['url']
      end
    end
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
    for i in 0..7
      id = phones[i]['data']['id']
      name = phones[i]['data']['name']
      price = phones[i]['data']['prices'][0]['price']
        begin
          img = phones[i]['data']['images'][0]['url']
          rescue NoMethodError => e
          if e.message.include?("undefined method `[]' for nil:NilClass")
           img = "https://picsum.photos/200"
          else
           img = phones[i]['data']['images'][0]['url']
          end
        end
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
