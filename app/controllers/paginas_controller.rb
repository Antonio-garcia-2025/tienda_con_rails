class PaginasController < ApplicationController
  def principal
    @productos = Producto.all
  end
  
  # NUEVA ACCIÓN PARA PROCESAR EL FORMULARIO
  def crear
    # 1. Recogemos los datos del formulario de forma segura
    nombre_form = params[:nombre].to_s.strip
    precio_form = params[:precio].to_f

    producto_existente = Producto.where("nombre LIKE ?", nombre_form).first
    
    if producto_existente
      nuevo_stock = (producto_existente.stock || 0) + 1
      producto_existente.update(stock: nuevo_stock)
    else
      producto = Producto.create(nombre: nombre_form, precio: precio_form, stock: 1)
    end
    redirect_to root_path
  end
  def eliminar
    #buscamos el producto por su ID
    producto = Producto.find(params[:id])
    #le ordenamos a la base de datos que lo elimine
    producto.destroy
    #redireccionamos al usuario a la página principal
    redirect_to root_path
  end
  
  #accion para sumar el stock de un producto
  def sumar_stock
    #buscamos el producto por su ID
    producto = Producto.find(params[:id])
    #sumamos 1 al stock del producto
    nuevo_stock = (producto.stock || 0) + 1
    #le decimos al modelo que guarde el nuevo stock
    producto.update(stock: nuevo_stock)
    #redireccionamos al usuario a la página principal
    redirect_to root_path
  end
end
