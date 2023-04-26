class SellerController < OnlyphonesController
  def index

    @id = comparador_params[:id]

    if @id != nil 
      @sell_info = sell_data
      @selected_phones = [Phone.new( image_url: @sell_info[0], name: @sell_info[1], precio: @sell_info[2])]
    end
  
    query = params[:query]

    if query
      @sell = list_to_search(query).uniq
    else
      @sell = []
    end
  
    if user_signed_in?
      @phones = current_user.phones.all
    else
      redirect_to onlyphones_path
    end

    @selected_phones ||= []
    @selected_phones = [] if @selected_phones.nil?
  
    @phone = Phone.new

  end

  def sell_data
    id = comparador_params[:id]
    info_sell = request_api
    begin
      img_sell = info_sell['data']['images'][0]['url']
    rescue NoMethodError
      img_sell = "https://picsum.photos/200"
    end
    nombre_sell = info_sell['data']['name']
    precio_sell = info_sell['data']['prices'][0]['price']
  
    selected_phone = Phone.new(name: nombre_sell, precio: precio_sell, image_url: img_sell)
    @selected_phones ||= []
    @selected_phones << selected_phone

    [img_sell, nombre_sell, precio_sell]
  end

  def comparador_params
    params.permit(:id, :query)
  end

  def add_phone
    @phone = current_user.phones.new(phone_params)
    puts params[:phone]
    if @phone.save
      redirect_to seller_path, notice: "Se añadio correctamente el celular."
    elsif params[:phone_id]
      @selected_phones.each do |phone|
        if phone.id == params[:phone_id].to_i
          @phone.image_url = phone.image_url
          @phone.name = phone.name
          @phone.precio = phone.precio
          break
        end
      end 
    else
      render :index
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

  def destroy
    phone = Phone.find(params[:id])
    phone.destroy
    redirect_to seller_path
  end

  private

  def phone_params
    params.require(:phone).permit(:name, :precio, params[:id], :image_url)
  end
end
