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
    
    @id2 = comparador_params[:id2]
    if @id2 != nil 
      @compare_info = compare_data
    end

    query = comparador_params[:query]
    if query
      list = list_to_search(query)
      @results = list.uniq
    end

    compare_algorithm

  end

  def compare_algorithm
    compare("precio", 2)
    compare("pantalla", 3)
    compare("memoria", 4)
    compare("camara", 5)
  end
  
  def compare(feature, index)
    if instance_variable_get("@#{feature}") < @compare_info[index]
      puts "el primero es mejor"
    elsif instance_variable_get("@#{feature}") > @compare_info[index]
      puts "el segundo es mejor"
    else
      puts "es un empate"
    end
  end

  def compare_data
    params[:id] = comparador_params[:id2]
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
      id = element['id']
      name = element['name']
      list << [id, name]
    end
    list
  end
  
  private
  
  def comparador_params
    params.permit(:id2, :query)
  end
end
