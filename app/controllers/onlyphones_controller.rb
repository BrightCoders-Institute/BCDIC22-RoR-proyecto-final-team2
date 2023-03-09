require "rest-client"
require "json"
require_relative "./api_key"

class OnlyphonesController < ApplicationController

  def index
    @phones = request_api
    @id = @phones['data']['id']
    @name = @phones['data']['name']
  end

  private
  def request_api
    url = "https://api.device-specs.io/api/smartphones/1"
    response = RestClient.get(url, {Authorization: "Bearer #{API_KEY}"})
    JSON.parse(response.to_str)
  end
end
