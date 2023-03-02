require "rest-client"

class OnlyphonesController < ApplicationController

  def index
    @phones = request_api
    @id = @phones['data']['id']
    @name = @phones['data']['name']
  end

  private
  def request_api
    url = "https://api.device-specs.io/api/smartphones/1"
    response = RestClient.get(url, {Authorization: 'Bearer 8a2d167edb6e4f6a52e113c893d590667a470208e78180ee442bb54741d5e1f3dbfc3ccde2649a200a298b9aa0a0b01b43456e6c41d2108d7d4957191f29c6f57fac34ea47fb6ee024ce949582618e0d9a6a2ff5240b0bfafdb5c54ed108b20b397b5b22ec5cdd2e1e4427a754761ee5848cee264d1ae8f44b04d6f1db5c61a5'})
    JSON.parse(response.to_str)
  end
end
