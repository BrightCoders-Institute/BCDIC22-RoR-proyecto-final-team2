require "rest-client"
require "json"
require_relative "./api_key"

class OnlyphonesController < ApplicationController

  def index
    @phones = request_api
  end

  def show
    @phone = request_api(params[:id])
    @phone_img = @phone['data']['images'][0]['url']
    @price = @phone['data']['prices'][0]['price']
    @currency = @phone['data']['prices'][0]['currency']
  end


  private
  def request_api(id_phone="")
    url = "https://api.device-specs.io/api/smartphones/#{id_phone}?populate=*"
    response = RestClient.get(url, {Authorization: "Bearer #{API_KEY}"})
    JSON.parse(response.to_str)
  end
end
