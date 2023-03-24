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
    @compare_info =compareInfo

    query = params[:query]
    if query
      list = list_to_search(query)
      @results = list
    else
      @results = ["Buscar telefono a comparar"]
    end
  end

  def compareInfo
    id_to_compare = 2591
    params[:id] = id_to_compare

    info_to_compare = request_api
    begin
      img_to_compare = info_to_compare['data']['images'][0]['url']
    rescue NoMethodError => e
      if e.message.include?("undefined method `[]' for nil:NilClass") 
        img_to_compare = "https://picsum.photos/200" 
      else
        img_to_compare = info_to_compare['data']['images'][0]['url']
      end
    end
    nombre_to_compare = info_to_compare['data']['name']
    precio_to_compare = info_to_compare['data']['prices'][0]['price']
    pantalla_to_compare = info_to_compare['data']['data']['display']['size__inch']
    memoria_to_compare = info_to_compare['data']['data']['storage']['capacity__gb']
    camara_to_compare = info_to_compare['data']['data']['camera']['camera_back__mp']
    procesador_to_compare = info_to_compare['data']['data']['cpu']['type']
    so_to_compare = info_to_compare['data']['data']['software']['os']

    [img_to_compare, nombre_to_compare, precio_to_compare, pantalla_to_compare, memoria_to_compare, camara_to_compare, procesador_to_compare, so_to_compare]
  end

  def list_to_search(query="")
    filter = query
    request_list = request_api_filters(filter)
    list = []
    data_list = request_list['data']
    data_list.each do |element|
      name = element['name']
      list << [name]
    end
    list
  end
end
