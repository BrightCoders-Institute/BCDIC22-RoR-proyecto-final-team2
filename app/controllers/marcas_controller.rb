class MarcasController < OnlyphonesController

  def index
    phone_brands.each_with_index do |brand, i|
      instance_variable_set("@phone_brand#{i+1}", brands(brand.to_s.capitalize))
    end
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

  private
  def phone_brands
    %i[apple samsung xiaomi motorola oppo google huawei]
  end
end
