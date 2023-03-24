class MarcasController < ApplicationController
    def index
        @random_phone = random
    end

    def random
        rd = rand 1..2597
        random_phone = request_api(rd)
        name = random_phone['data']['name']
        price = random_phone['data']['prices'][0]['price']
        img = random_phone['data']['images'][0]['url']
        [name, price, img]
    end

    private
    def request_api(id_phone="")
        url = "https://api.device-specs.io/api/smartphones/#{id_phone}?populate=*"
        response = RestClient.get(url, {Authorization: "Bearer #{API_KEY}"})
        JSON.parse(response.to_str)
    end
end
