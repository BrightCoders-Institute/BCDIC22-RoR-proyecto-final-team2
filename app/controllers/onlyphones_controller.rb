require "rest-client"
require "json"
require_relative "./api_key"

class OnlyphonesController < ApplicationController

  def index
    @phones = request_api
    @random_phone = random
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

  private
  def request_api
    url = "https://api.device-specs.io/api/smartphones/#{params[:id]}?populate=*"
    response = RestClient.get(url, {Authorization: "Bearer #{API_KEY}"})
    JSON.parse(response.to_str)
  end
end
