require "rest-client"
require "json"
require_relative "./api_key"
class MarcasController < OnlyphonesController

  def index
    @phone_brand1 = brands("Apple") 
    @phone_brand2 = brands("Samsung")
    @phone_brand3 = brands("Xiaomi")
    @phone_brand4 = brands("Oppo")
    @phone_brand5 = brands("Motorola")
    @phone_brand6 = brands("Google")
    @phone_brand7 = brands("Huawei") 
  end

  def brands(brand_filter)
    phones = request_api_filters(brand_filter)
    array_brands = []
    for i in 0..3
      name = phones['data'][i]['name']
      begin
        price = phones['data'][i]['prices'][0]['price']
        rescue NoMethodError => e
        if e.message.include?("undefined method `[]' for nil:NilClass")
          price = "$$$"
        else
          price = phones['data'][i]['prices']['price']
        end
      end
      begin
        img = phones['data'][i]['images'][0]['url']
        rescue NoMethodError => e
        if e.message.include?("undefined method `[]' for nil:NilClass")
          img = "https://picsum.photos/200"
        else
          img = phones['data'][i]['images'][0]['url']
        end
      end
      array_brands << [name, price, img]
    end
    array_brands
  end
end
