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

  def random
    rd = rand 1..2597
    random_phone = request_api(rd)
    name = random_phone['data']['name']
    price = random_phone['data']['prices'][0]['price']
    img = random_phone['data']['images'][0]['url']
    [name, price, img]
  end

  def request_bestphones
    itemid
    responses = []
    itemid.each do |id|
      response = request_api(id)
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

  def request_api(id_phone="")
    url = "https://api.device-specs.io/api/smartphones/#{id_phone}?populate=*"
    response = RestClient.get(url, {Authorization: "Bearer #{API_KEY}"})
    JSON.parse(response.to_str)
  end
end