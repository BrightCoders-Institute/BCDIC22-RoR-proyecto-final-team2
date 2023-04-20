class SellerController < OnlyphonesController
  def index
    query = params[:query]
    puts "query: #{query}"
    if query
      list = list_to_search(query)
      
      @sell = list.uniq
    else
      @sell = []
    end
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
end
