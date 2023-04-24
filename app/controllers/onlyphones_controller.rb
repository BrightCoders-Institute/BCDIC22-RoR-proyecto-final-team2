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
  
  def show
    @phone = request_api
    @phone_img = @phone['data']['images'][0]['url']
    @price = @phone['data']['prices'][0]['price']
    @currency = @phone['data']['prices'][0]['currency']
  end

  def random
    rd = rand 1..2597
    params[:id] = rd
    random_phone = request_api
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
    [name, price, img]
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
       array_phones << [name, price, img]       
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
