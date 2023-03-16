class ComparadorController < OnlyphonesController
  def index
    comparador_data = request_api
    begin
      @img = comparador_data['data']['images'][0]['url']
    rescue NoMethodError => e
      if e.message.include?("undefined method `[]' for nil:NilClass") 
        @img = "https://picsum.photos/200" 
      else
        @img = comparador_data['data']['images'][0]['url']
      end
    end
    @nombre = comparador_data['data']['name']
    @precio = comparador_data['data']['prices'][0]['price']
    @pantalla = comparador_data['data']['data']['display']['size__inch']
    @memoria = comparador_data['data']['data']['storage']['capacity__gb']
    @camara = comparador_data['data']['data']['camera']['camera_back__mp']
    @procesador = comparador_data['data']['data']['cpu']['type']
    @so = comparador_data['data']['data']['software']['os']
  end
end
