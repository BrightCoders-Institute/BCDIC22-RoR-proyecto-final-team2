class CartController < OnlyphonesController

  def index

    id_telefonos_cart = session[:telefonos_id]
    id_telefono = id_telefonos_cart[-1]
    params[:id] = id_telefono
    phone_in_cart = request_api
    @phone_in_cart_img = phone_in_cart['data']['images'][0]['url']
    @phone_in_cart_name = phone_in_cart['data']['name']
    @phone_in_cart_price = phone_in_cart['data']['prices'][0]['price']

    session[:cart_price] = @phone_in_cart_price
    session[:counter] = 1
    @total_cart = session[:total_cart]

  end

  def delete
    id_telefonos_cart = session[:telefonos_id]
    id_telefonos_cart_sin_duplicados = id_telefonos_cart.uniq

    Transaccion.where(id: id_telefonos_cart_sin_duplicados).destroy_all
    redirect_to carrito_path
  end

  def update

    id_telefonos_cart = session[:telefonos_id]
    id_telefonos_cart_sin_duplicados = id_telefonos_cart.uniq

    Transaccion.where(id: id_telefonos_cart_sin_duplicados).update_all(status: "Comprado")

    redirect_to root_path
  end

  def increment
    session[:counter] += 1
    session[:total_cart] = (session[:cart_price] * session[:counter])
    render json: { value: session[:counter], total_value: session[:total_cart] } 
  end
  
  def decrement
    if session[:counter] == 0
      session[:counter] = 1
    end 
    session[:counter] -= 1
    session[:total_cart] = (session[:cart_price] * session[:counter])
    render json: { value: session[:counter], total_value: session[:total_cart] } 
  end  
end
