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
    @ide = comparador_data['data']['id']
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
      @results_algorithm = compare_algorithm
    end

    query = comparador_params[:query]
    if query
      list = list_to_search(query)
      @results = list.uniq
    end
    
  end

  def compare_algorithm
    compare_results = []
    compare_results << compare("precio", 2)
    compare_results << compare("pantalla", 3)
    compare_results << compare("memoria", 4)
    compare_results << compare("camara", 5)
    compare_results
  end
  
  def compare(feature, index)
    if feature == "precio"
      if instance_variable_get("@#{feature}") < @compare_info[index]
        result = ['check','xmark']
      elsif instance_variable_get("@#{feature}") > @compare_info[index]
        result = ['xmark','check']
      else
        result = ['xmark','check']
      end
    else  
      if instance_variable_get("@#{feature}") > @compare_info[index]
        result = ['check','xmark']
      elsif instance_variable_get("@#{feature}") < @compare_info[index]
        result = ['xmark','check']
      else
        result = ['check','check']
      end
    end
    result
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
    id_to_compare = info_to_compare['data']['id']

    [img_to_compare, nombre_to_compare, precio_to_compare, pantalla_to_compare, memoria_to_compare, camara_to_compare, procesador_to_compare, so_to_compare, id_to_compare]
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
